# frozen_string_literal: true

require 'selenium-webdriver'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/logout_extension'
require './functions_library/login_app_extension'
require './functions_library/employee_dashboard_extension'
require './functions_library/manager_dashboard_extension'
require './functions_library/holiday_extension'
require './functions_library/sickness_extension'
require './functions_library/navigate_around_app_employee_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/ui_page_element_check_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize

class TestLineManagerClosingSickness
  attr_accessor :driver

  # this will test an employee creating a new sickness record without an end date
  # they will then try to create another open sickness record which should fail
  # and display the error can not have more than 1 open sickness record
  # It will then delete the sickness records

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  def execute
    puts 'Running - test_line_manager_closing_open_sickness.rb'
    test_01_employee_creates_sickness
    test_02_lm_closes_sickness
    test_03_lm_delete_sickness
    puts 'Complete - test_line_manager_closing_open_sickness.rb'
  end

  def test_01_employee_creates_sickness
    puts 'Test_01 Started'
    puts 'Start test - Employee creates open leave request'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_functionality_employee
    puts 'Pass - Login as employee'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Pass - Selects HR'
    sleep 2
    EmployeeDashboardExtension.new(driver).click_widget('Report new sickness')
    puts 'Pass - open Employee sickness form'
    sleep 1
    SicknessExtension.new(driver).employee_create_open_sickness
    puts 'Pass - creates sickness record for employee'
    sleep 1
    SicknessExtension.new(driver).click_sickness_breadcrumb
    puts 'Pass - navigates to employee sickness index'
    if SicknessExtension.new(driver).sickness_status == 'open'
      puts 'Pass - status is Open'
    else
      puts 'FAIL - status is incorrect'
    end
    puts 'Test_01 complete'
  end

  def test_02_lm_closes_sickness
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_functionality_lm
    puts 'Pass - Login as lm'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Pass - Selects HR'
    sleep 1
    ManagerDashboardExtension.new(driver).switch_todos_to_sickness
    puts 'Pass - Todos Switched to Sickness'
    sickness_id = ManagerDashboardExtension.new(driver).open_sickness_id_from_dashboard
    ManagerDashboardExtension.new(driver).view_open_sickness_request
    sleep 1
    SicknessExtension.new(driver).manager_closing_sickness(sickness_id)
    sleep 1
    SicknessExtension.new(driver).click_sickness_breadcrumb
    sleep 1
    if SicknessExtension.new(driver).sickness_status == 'closed'
      puts 'Pass - status is Open'
    else
      puts 'FAIL - status is incorrect'
    end
  end

  def test_03_lm_delete_sickness
    SicknessExtension.new(driver).delete_sickness_record
    puts 'Pass - deletes second sickness record'
    sleep 1
    puts 'Test 03 - Completed'
  end
end
TestLineManagerClosingSickness.new.execute

# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
