# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/navigate_around_app_lm_extension'
require './functions_library/navigate_around_app_employee_extension'
require './functions_library/employee_dashboard_extension'
require './functions_library/manager_dashboard_extension'
require './functions_library/training_extension'
require './functions_library/people_page_extension'
require './functions_library/reports_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/ClassLength
class VerifyTrainingReport
  attr_accessor :driver

  # Tests that employee training appears in the training report

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  def execute
    puts 'Starting test_1020_verify_training_report'
    test_01_employee_opens_training_request_form
    test_02_fill_out_form
    test_03_hr_opens_report
    test_04_compare_report_values
    test_05_manager_approves_training
    test_06_delete_training
    puts 'test_1020_verify_training_report Finished'
  end

  def test_01_employee_opens_training_request_form
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'PASS - load landing page'
    LoginExtension.new(driver).login_functionality_employee
    puts 'PASS - logged in as std employee'
    LoginAppExtension.new(driver).select_hr
    puts 'PASS - hr selected'
    sleep 1
    EmployeeDashboardExtension.new(driver).expand_dashboard_container
    sleep 1
    EmployeeDashboardExtension.new(driver).click_widget('Request training')
    puts 'PASS - Training Form Opened'
  end

  def test_02_fill_out_form
    TrainingExtension.new(driver).give_training_request_name
    puts 'PASS - Name Added'
    TrainingExtension.new(driver).select_company_training_type
    puts 'PASS - Training Type Selected'
    TrainingExtension.new(driver).select_company_training_category
    puts 'PASS - Training Category Selected'
    TrainingExtension.new(driver).add_training_start_date
    puts 'PASS - Start Date Added'
    TrainingExtension.new(driver).add_training_end_date
    puts 'PASS - End Date Added'
    TrainingExtension.new(driver).add_training_cost
    puts 'PASS - Training Added'
    TrainingExtension.new(driver).add_training_expires_on_date
    puts 'PASS - Expiry Date Added'
    TrainingExtension.new(driver).add_training_structured_units
    puts 'PASS - Structured Units Added'
    TrainingExtension.new(driver).add_training_unstructured_units
    puts 'PASS - Unstructured Units Added'
    TrainingExtension.new(driver).confirm_training_form
    sleep 1
    puts 'PASS - Training Request Form Submitted'
  end

  def test_03_hr_opens_report
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'PASS - load landing page'
    LoginExtension.new(driver).login_functionality_hr
    puts 'PASS - Logged in as LM'
    LoginAppExtension.new(driver).select_hr
    puts 'PASS - hr selected'
    sleep 1
    ManagerDashboardExtension.new(driver).switch_todos_to_training
    sleep 1
    ManagerDashboardExtension.new(driver).view_open_training_request
    puts 'PASS - Training Request Opened by Manager'
    $training_id = TrainingExtension.new(driver).training_id_manager # rubocop:disable Style/GlobalVars
    AppNavigationExtensionManager.new(driver).open_reports
  end

  def test_04_compare_report_values
    ReportsExtension.new(driver).click_on_report('Training')
    sleep 1
    training_title = ReportsExtension.new(driver).chosen_column_from_first_row('4')
    ReportsExtension.new(driver).compare_text_of_column_against_expected('Employee Requested Training', training_title)
    training_status = ReportsExtension.new(driver).chosen_column_from_first_row('10')
    ReportsExtension.new(driver).compare_text_of_column_against_expected('Requested', training_status)
    ReportsExtension.new(driver).filter_by_department('Customer Service')
    puts 'PASS - Department Filter added'
    sleep 1
    ReportsExtension.new(driver).check_table_not_empty
    puts 'PASS - Row still present'
    sleep 1
    ReportsExtension.new(driver).filter_by_location('Working from Home')
    sleep 1
    ReportsExtension.new(driver).check_table_is_empty
    puts 'PASS - Table is empty'
    ReportsExtension.new(driver).clear_filters
    puts 'PASS - Filter Cleared'
    sleep 1
    ReportsExtension.new(driver).filter_by_start_next_month
    puts 'PASS - Filter Applied'
    sleep 1
    ReportsExtension.new(driver).check_table_not_empty
    puts 'PASS - Table Empty'
    sleep 1
    ReportsExtension.new(driver).clear_filters
    puts 'PASS - Filter Cleared'
    sleep 1
    ReportsExtension.new(driver).click_action_for_selected_row($training_id) # rubocop:disable Style/GlobalVars
    puts 'PASS - Request Opened'
  end

  def test_05_manager_approves_training
    TrainingExtension.new(driver).manager_approves_training_request
    puts 'PASS - Request Approved'
    sleep 1
    AppNavigationExtensionManager.new(driver).open_reports
    sleep 1
    ReportsExtension.new(driver).click_on_report('Training')
    sleep 1
    training_status = ReportsExtension.new(driver).chosen_column_from_first_row('10')
    ReportsExtension.new(driver).compare_text_of_column_against_expected('Approved', training_status)
  end

  def test_06_delete_training
    AppNavigationExtensionManager.new(driver).search_employee('Employee User')
    puts 'PASS - Employee Search and Opened'
    sleep 2
    AppNavigationExtensionManager.new(driver).open_employee_training
    puts 'PASS - Opened Employee Training'
    sleep 2
    TrainingExtension.new(driver).delete_training_request
    puts 'PASS - Training Request Deleted'
    sleep 2
  end
end
VerifyTrainingReport.new.execute
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/ClassLength
