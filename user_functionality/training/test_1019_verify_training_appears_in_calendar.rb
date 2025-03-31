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

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize

class TrainingInCalendar
  attr_accessor :driver

  # Tests an employee requesting training

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def execute
    test_01_employee_opens_training_request_form
    test_02_fill_out_form
    test_03_confirm_request_training
    test_04_view_calendar
    test_05_lm_rejects_request
    test_06_delete_request
  end

  def test_01_employee_opens_training_request_form
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'PASS - load landing page'
    LoginExtension.new(driver).login_setup_acc_lm_employee_user
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

  def test_04_view_calendar
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a > svg').click
    puts 'PASS  - Clicked on training request'
    training_id = TrainingExtension.new(driver).get_training_id_employee
    # driver.find_element(css: 'body > div.hr-nav-container > div:nth-child(1) > div > div.header-container > header > div.header__menu > ul.menu.menu--horizontal.header__icon-button-menu > li:nth-child(2) > a').click
    NavigateAroundAppEmployee.new(driver).navigate_to_calendar
    puts 'PASS - Calendar Opened'
    calendar_training = "EmployeeTrainingCourse_#{training_id}"
    driver.find_element(id: calendar_training)
    puts 'PASS - Training Found in Calendar'
  end

  def test_05_lm_rejects_request
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'PASS - load landing page'
    LoginExtension.new(driver).login_setup_acc_lmemp_employee_user
    puts 'PASS - Logged in as LM'
    LoginAppExtension.new(driver).select_hr
    puts 'PASS - hr selected'
    sleep 1
    ManagerDashboardExtension.new(driver).switch_todos_to_training
    sleep 1
    ManagerDashboardExtension.new(driver).view_open_training_request
    puts 'PASS - Training Request Opened by Manager'
    current_url = driver.current_url
    split_url = current_url.split('training_courses/', 0)
    training_id = split_url[2]
    calendar_training = "EmployeeTrainingCourse_#{training_id}"
    sleep 1
    TrainingExtension.new(driver).manager_rejects_training_request
    puts 'PASS - Clicks reject'
    sleep 1
    TrainingExtension.new(driver).fill_out_rejection_form
    puts 'PASS - Request Rejected'
    sleep 1
    driver.find_element(css: 'body > div.hr-nav-container > div:nth-child(1) > div > div.header-container > header > div.header__menu > ul.menu.menu--horizontal.header__icon-button-menu > li:nth-child(2) > a').click
    begin
      driver.find_element(id: calendar_training)
      puts 'FAIL - Training still exists'
      false
    rescue Selenium::WebDriver::Error::NoSuchElementError
      puts 'PASS - Training Removed from calendar'
      true
    end
  end

  def test_06_delete_request
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'PASS - load landing page'
    LoginExtension.new(driver).login_setup_acc_hr_user
    puts 'PASS - Logged in as HR'
    LoginAppExtension.new(driver).select_hr
    puts 'PASS - hr selected'
    AppNavigationExtensionManager.new(driver).navigate_to_people_screen
    PeoplePageExtension.new(driver).select_employee_from_list('Employee Std User')
    driver.find_element(id: 'training').click
    TrainingExtension.new(driver).delete_training_request
    sleep 1
  end
end

TrainingInCalendar.new.execute
