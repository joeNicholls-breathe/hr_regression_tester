# frozen_string_literal: true

require 'selenium-webdriver'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/logout_extension'
require './functions_library/login_app_extension'
require './functions_library/holiday_auto_approval_extension'
require './functions_library/holiday_extension'
require './functions_library/navigate_around_app_employee_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/employee_dashboard_extension'
require './functions_library/people_page_extension'

# rubocop:disable Metrics/ClassLength
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class TestAutoApprovedHoliday
  attr_accessor :driver

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  # this test is to test auto approval for holiday requests
  # the first 3 employees are in the same department and have
  # a rule that 2 employees can be off for the requests to be
  # approved automatically

  def test_auto_approval_requests
    puts 'Running - test_employee_auto_approval_process.rb'
    test_01_auto_approval_employee_one
    test_02_auto_approval_employee_two
    test_03_auto_approval_employee_three
    test_04_delete_absences
    driver.close
    puts 'Complete - test_employee_auto_approval_process.rb'
  end

  def test_01_auto_approval_employee_one
    puts 'Start test - Employee one creates absence record'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_auto_approval_employee_one
    puts 'Pass - Login as auto approval one'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Pass - HR selected'
    sleep 1
    EmployeeDashboardExtension.new(driver).click_widget('Request leave')
    puts 'Pass - opens add absence record'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).holiday_request_for_auto_approval
    puts 'Pass - creates absence which should be auto approved'
    sleep 2
    NavigateAroundAppEmployee.new(driver).navigate_to_leave_request_widget_manage_leave
    sleep 1
    HolidayExtension.new(driver).compare_booked_amount('1.0 day')
    HolidayExtension.new(driver).compare_holiday_allowance('19.0 days')
    puts 'Pass - absence created, totals correct'
    LogoutExtension.new(driver).user_logout
    puts 'Pass - Holiday Employee logged out'
    puts 'Test complete for employee one'
  end

  def test_02_auto_approval_employee_two
    puts 'Start test - Employee two creates absence record'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_auto_approval_employee_two
    puts 'Pass - Login as auto approval one'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Pass - HR selected'
    sleep 1
    EmployeeDashboardExtension.new(driver).click_widget('Request leave')
    puts 'Pass - opens add absence record'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).holiday_request_for_auto_approval
    puts 'Pass - creates absence which should be auto approved'
    sleep 2
    NavigateAroundAppEmployee.new(driver).navigate_to_leave_request_widget_manage_leave
    sleep 1
    HolidayExtension.new(driver).compare_booked_amount('1.0 day')
    HolidayExtension.new(driver).compare_holiday_allowance('19.0 days')
    puts 'Pass - absence created, totals correct'
    puts 'Test complete for employee two'
  end

  def test_03_auto_approval_employee_three
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_auto_approval_employee_three
    puts 'Pass - Login as auto approval one'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Pass - HR selected'
    sleep 1
    EmployeeDashboardExtension.new(driver).click_widget('Request leave')
    puts 'Pass - opens add absence record'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).holiday_request_for_auto_approval
    puts 'Pass - creates absence which should not be auto approved'
    sleep 3
    NavigateAroundAppEmployee.new(driver).navigate_to_leave_request_widget_manage_leave
    sleep 1
    HolidayExtension.new(driver).compare_booked_amount('0.0 days')
    HolidayExtension.new(driver).compare_holiday_allowance('20.0 days')
    puts 'Pass - absence created, totals correct'
    puts 'Test complete for employee three'
  end

  def test_04_delete_absences
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Start Test - Holiday approver approves request'
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_admin
    puts 'Pass - Login as admin'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Pass - Selects HR'
    sleep 1
    AppNavigationExtensionManager.new(driver).open_purge_from_url
    HolidayExtension.new(driver).purge_holiday_data('auto approval-one')
    puts 'Pass - auto approval-one purged'
    sleep 1
    HolidayExtension.new(driver).purge_holiday_data('auto approval-two')
    sleep 1
    puts 'Pass - auto approval-two purged'
    HolidayExtension.new(driver).purge_holiday_data('auto approval-three')
    puts 'Pass - auto approval-three purged'
    sleep 1
    puts 'Pass - absences purged'
    puts 'test complete - absences deleted for auto approval employee one'
  end
end
# rubocop:enable Metrics/ClassLength
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
TestAutoApprovedHoliday.new.test_auto_approval_requests
