# frozen_string_literal: true

require 'selenium-webdriver'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/logout_extension'
require './functions_library/login_app_extension'
require './functions_library/employee_dashboard_extension'
require './functions_library/holiday_extension'
require './functions_library/sickness_extension'
require './functions_library/navigate_around_app_employee_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/ui_page_element_check_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize

class TestEmployeeOneOpenSicknessProcess
  attr_accessor :driver

  # This will test an employee creating a sickness record with a return date
  # this should then allow the employee to create a second sickness record
  # It will then delete the sickness records

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  def test_leave_sickness_request
    puts 'Running - test_employee_creating_open_sickness.rb'
    test_01_employee_creates_sickness
    test_02_employee_tries_to_create_another_sickness
    test_03_admin_delete_sicknesses
    puts 'Complete - test_employee_creating_open_sickness.rb'
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
    sleep 1
    EmployeeDashboardExtension.new(driver).click_widget('Report new sickness')
    puts 'Pass - open Employee sickness form'
    sleep 1
    SicknessExtension.new(driver).employee_sickness_create
    puts 'Pass - creates sickness record for functionality employee'
    sleep 1
    SicknessExtension.new(driver).click_sickness_breadcrumb
    puts 'Pass - navigates to employee sickness index'
    sleep 1
    SicknessExtension.new(driver).edit_sickness_record
    puts 'Pass - edits sickness record'
    sleep 1
    puts 'Test-01 complete'
  end

  def test_02_employee_tries_to_create_another_sickness
    puts 'Test_02 Started'
    SicknessExtension.new(driver).click_sickness_breadcrumb
    puts 'Pass - navigates to employee sickness index'
    SicknessExtension.new(driver).open_sickness_form
    puts 'Pass - opens add sickness record'
    sleep 1
    SicknessExtension.new(driver).employee_sickness_two_create
    puts 'Pass - creates second sickness record for holiday employee'
    sleep 2
    SicknessExtension.new(driver).click_sickness_breadcrumb
    puts 'Pass - navigates to employee sickness index'
    sleep 2
    LogoutExtension.new(driver).user_logout
    puts 'Pass - Holiday Employee logged out'
    puts 'Test_02 complete'
  end

  def test_03_admin_delete_sicknesses
    puts 'Start test 3 - Deletes holiday and sickness information for employee'
    LoginExtension.new(driver).login_functionality_admin
    puts 'Pass - Login as admin'
    sleep 1
    AppNavigationExtensionManager.new(driver).search_employee('Employee User')
    puts 'Pass - User Opened'
    sleep 1
    EmployeeProfileExtension.new(driver).open_employee_sickness
    puts 'Pass - navigates to sickness index'
    sleep 1
    SicknessExtension.new(driver).delete_sickness_record
    puts 'Pass - deletes first sickness record'
    sleep 1
    SicknessExtension.new(driver).delete_sickness_record
    puts 'Pass - deletes second sickness record'
    sleep 1
    puts 'Test 3 complete - sicknesses deleted'
  end

  def test_03_lm_delete_sickness
    SicknessExtension.new(driver).delete_sickness_record
    puts 'Pass - deletes second sickness record'
    sleep 1
    puts 'Test 03 - Completed'
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

TestEmployeeOneOpenSicknessProcess.new.test_leave_sickness_request
