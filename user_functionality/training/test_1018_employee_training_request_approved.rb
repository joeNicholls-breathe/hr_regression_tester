# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/employee_dashboard_extension'
require './functions_library/manager_dashboard_extension'
require './functions_library/training_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class TestEmployeeTrainingApproved
  attr_accessor :driver

  # Tests an employee requesting training

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  def execute
    puts 'Starting test_1018_employee_training_request_approved'
    test_01_employee_opens_training_request_form
    test_02_fill_out_form
    test_03_confirm_request_training
    test_04_line_manager_approves_request
    test_05_edit_form
    test_06_delete_training_request
    puts 'test_1018_employee_training_request_approved Finished'
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
    puts 'PASS - Training Request Form Submitted'
  end

  def test_03_confirm_request_training
    TrainingExtension.new(driver).click_training_breadcrumb
    puts 'PASS - Navigate back to training overview'
    TrainingExtension.new(driver).compare_training_request_status('Requested')
  end

  def test_04_line_manager_approves_request
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'PASS - load landing page'
    LoginExtension.new(driver).login_functionality_lm
    puts 'PASS - Logged in as LM'
    LoginAppExtension.new(driver).select_hr
    puts 'PASS - hr selected'
    ManagerDashboardExtension.new(driver).switch_todos_to_training
    sleep 1
    ManagerDashboardExtension.new(driver).view_open_training_request
    puts 'PASS - Training Request Opened by Manager'
    sleep 1
    TrainingExtension.new(driver).manager_approves_training_request
    puts 'PASS - Training Request Approved'
    TrainingExtension.new(driver).click_training_breadcrumb
    puts 'PASS - Training BreadCrumb Clicked'
    sleep 1
    TrainingExtension.new(driver).compare_training_request_status('Approved')
  end

  def test_05_edit_form
    TrainingExtension.new(driver).open_edit_modal
    puts 'PASS - Click edit icon'
    TrainingExtension.new(driver).set_outcome_to_passed
    TrainingExtension.new(driver).confirm_training_form
    puts 'PASS - Training Request Form Submitted'
    TrainingExtension.new(driver).click_training_breadcrumb
    outcome = TrainingExtension.new(driver).training_outcome
    if outcome == 'Passed'
      puts 'PASS - Outcome updated to Passed'
    else
      puts 'FAIL - Outcome not marked as Passed'
    end
  end

  def test_06_delete_training_request
    TrainingExtension.new(driver).delete_training_request
    sleep 2
    puts 'PASS - Training Request Deleted'
  end
end
TestEmployeeTrainingApproved.new.execute
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
