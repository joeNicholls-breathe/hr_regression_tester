# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/calendar_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/navigate_around_app_lm_extension'
require './functions_library/navigate_around_app_employee_extension'
require './functions_library/employee_dashboard_extension'
require './functions_library/manager_dashboard_extension'
require './functions_library/training_extension'
require './functions_library/people_page_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize

class TrainingDashboard # rubocop:disable Metrics/ClassLength
  attr_accessor :driver

  # Tests that employee training appears manager dashboards

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  def execute
    puts 'Starting test_2021_verify_training_dashboard_widgets'
    test_01_employee_opens_training_request_form
    test_02_fill_out_form
    test_03_confirm_request_training
    test_04_line_manager_approves_request
    test_05_check_next_7_days
    test_06_delete_request
    puts 'test_2021_verify_training_dashboard_widgets Finished'
  end

  def test_01_employee_opens_training_request_form
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'PASS - load landing page'
    LoginExtension.new(driver).login_functionality_employee
    puts 'PASS - logged in as std employee'
    LoginAppExtension.new(driver).select_hr
    puts 'PASS - hr selected'
    sleep 2
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
    TrainingExtension.new(driver).add_training_start_date_next_week
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
    sleep 1
    NavigateAroundAppEmployee.new(driver).click_dashboard_lhn
    sleep 1
    EmployeeDashboardExtension.new(driver).expand_dashboard_container
    sleep 1
    card_header = EmployeeDashboardExtension.new(driver).find_open_training_request
    card_test = card_header.text
    if card_test == '1 request'
      puts 'PASS - Request Shows On Dashboard'
    else
      puts "FAIL - #{card_test} should be 1"
    end
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
    requested_employee = ManagerDashboardExtension.new(driver).find_employee_requested_training
    if requested_employee == 'Employee User'
      puts 'PASS - Employee User Training Requested'
    else
      puts "FAIL - Training has been requested by #{requested_employee}"
    end
    ManagerDashboardExtension.new(driver).view_open_training_request
    sleep 1
    TrainingExtension.new(driver).manager_approves_training_request
  end

  def test_05_check_next_7_days
    driver.find_element(id: 'top-menu-menu-item-0-0').click
    puts 'PASS - Dashboard Opened'
    next_7_days_text = ManagerDashboardExtension.new(driver).find_next_7_days_requested_training
    if next_7_days_text.include? 'Employee Requested Training'
      puts 'PASS - Training in next 7 days widget'
    else
      puts 'FAIL - Training not in next 7 days widget'
    end
  end

  def test_06_delete_request
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'PASS - load landing page'
    LoginExtension.new(driver).login_functionality_hr
    puts 'PASS - Logged in as HR'
    LoginAppExtension.new(driver).select_hr
    puts 'PASS - hr selected'
    AppNavigationExtensionManager.new(driver).search_employee('Employee User')
    puts 'PASS - Employee Searched and Opened'
    wait = Selenium::WebDriver::Wait.new(timeout: 20)
    wait.until { driver.find_element(id: 'training').displayed? }
    AppNavigationExtensionManager.new(driver).open_employee_training
    puts 'PASS - Opened Employee Training'
    sleep 2
    TrainingExtension.new(driver).delete_training_request
    puts 'PASS - Training Request Deleted'
    sleep 2
  end
end

TrainingDashboard.new.execute
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
