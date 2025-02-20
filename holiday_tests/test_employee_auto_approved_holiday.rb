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
    @driver = Selenium::WebDriver.for :chrome
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
    test_04_delete_absences_for_auto_approval_employee_one
    test_05_delete_absences_for_auto_approval_employee_two
    test_06_delete_absences_for_auto_approval_employee_three
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
    HolidayExtension.new(driver).compare_booked_amount('1.0 days')
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
    HolidayExtension.new(driver).compare_booked_amount('1.0 days')
    HolidayExtension.new(driver).compare_holiday_allowance('19.0 days')
    puts 'Pass - absence created, totals correct'
    LogoutExtension.new(driver).user_logout
    puts 'Pass - Holiday Employee logged out'
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
    sleep 2
    NavigateAroundAppEmployee.new(driver).navigate_to_leave_request_widget_manage_leave
    HolidayExtension.new(driver).compare_booked_amount('0.0 days')
    HolidayExtension.new(driver).compare_holiday_allowance('20.0 days')
    puts 'Pass - absence created, totals correct'
    LogoutExtension.new(driver).user_logout
    puts 'Pass - Holiday Employee logged out'
    puts 'Test complete for employee three'
  end

  def test_04_delete_absences_for_auto_approval_employee_one
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Start Test - Holiday approver approves request'
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_auto_approval_admin
    puts 'Pass - Login as admin'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Pass - Selects HR'
    sleep 1
    purge_employee('auto approval-one')
    puts 'Pass - absences purged'
    sleep 2
    if HolidayExtension.new(driver).booked_amount == '0.0 days'
      puts 'Pass - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
    puts 'test complete - absences deleted for auto approval employee one'
  end

  def test_05_delete_absences_for_auto_approval_employee_two
    puts 'Start test to purge absence data'
    purge_employee('auto approval-two')
    puts 'Pass - absences purged'
    sleep 2
    if HolidayExtension.new(driver).booked_amount == '0.0 days'
      puts 'Pass - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
    puts 'test complate - absences deleted for auto approval employee two'
  end

  def test_06_delete_absences_for_auto_approval_employee_three
    puts 'Start test to purge absence data'
    purge_employee('auto approval-three')
    puts 'Pass - absences purged'
    sleep 2
    if HolidayExtension.new(driver).booked_amount == '0.0 days'
      puts 'Pass - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
    puts 'test complate - absences deleted for auto approval employee three'
  end

  def purge_employee(employee)
    AppNavigationExtensionManager.new(driver).navigate_to_data
    AppNavigationExtensionManager.new(driver).open_purge_data
    puts 'PASS - Purge Data Opened'
    HolidayAutoApprovalExtension.new(driver).purge_holiday_data_auto_approval_employee(employee)
    puts "#{employee}'s Data Purged"
    AppNavigationExtensionManager.new(driver).navigate_to_people_list
    PeoplePageExtension.new(driver).select_employee_from_list(employee)
    AppNavigationExtensionManager.new(driver).open_employee_leave
    puts "#{employee}'s Leave Opened"
  end
end
# rubocop:enable Metrics/ClassLength
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
TestAutoApprovedHoliday.new.test_auto_approval_requests
