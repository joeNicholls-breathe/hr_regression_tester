# frozen_string_literal: true

require 'selenium-webdriver'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/logout_extension'
require './functions_library/login_app_extension'
require './functions_library/holiday_auto_approval_extension'
require './functions_library/holiday_extension'
require './functions_library/navigate_around_app_employee'

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
  # employee three and non approval employees requests should
  # not be approved and go through as leave requests

  def test_auto_approval_requests
    puts 'Running - test_employee_auto_approval_process.rb'
    test_01_auto_approval_employee_one
    test_02_auto_approval_employee_two
    test_03_auto_approval_employee_three
    test_04_auto_approval_off_employee_new_leave_request
    test_05_delete_absences_for_auto_approval_employee_one
    test_06_delete_absences_for_auto_approval_employee_two
    test_07_delete_absences_for_auto_approval_employee_three
    test_08_delete_absences_for_auto_approval_employee_four
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
    HolidayAutoApprovalExtension.new(driver).auto_approval_employee_one_new_leave_request
    puts 'Pass - opens add absence record'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).holiday_request_for_auto_approval
    puts 'Pass - creates absence which should be auto approved'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).auto_approval_employee_one_holiday_index
    if HolidayExtension.new(driver).booked_amount == '1.0 day'
      puts 'Pass - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
    if HolidayExtension.new(driver).available_amount == '19.0 days'
      puts 'Pass - available_amount total correct'
    else
      puts 'FAIL - available_amount total incorrect'
    end
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
    puts 'Pass - Login as auto approval two'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).auto_approval_employee_two_new_leave_request
    puts 'Pass - opens add absence record'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).holiday_request_for_auto_approval
    puts 'Pass - creates absence which should be auto approved'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).auto_approval_employee_two_holiday_index
    if HolidayExtension.new(driver).booked_amount == '1.0 day'
      puts 'Pass - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
    if HolidayExtension.new(driver).available_amount == '19.0 days'
      puts 'Pass - available_amount total correct'
    else
      puts 'FAIL - available_amount total incorrect'
    end
    puts 'Pass - absence created, totals correct'
    LogoutExtension.new(driver).user_logout
    puts 'Pass - Holiday Employee logged out'
    puts 'Test complete for employee two'
  end

  def test_03_auto_approval_employee_three
    puts 'Start test - Employee three creates absence record'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_auto_approval_employee_three
    puts 'Pass - Login as auto approval three'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).auto_approval_employee_three_new_leave_request
    puts 'Pass - opens add absence record'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).holiday_request_for_auto_approval
    puts 'Pass - creates absence which should be auto approved'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).auto_approval_employee_three_holiday_index
    if HolidayExtension.new(driver).booked_amount == '0.0 days'
      puts 'Pass - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
    if HolidayExtension.new(driver).available_amount == '20.0 days'
      puts 'Pass - available_amount total correct'
    else
      puts 'FAIL - available_amount total incorrect'
    end
    puts 'Pass - absence created, totals correct'
    LogoutExtension.new(driver).user_logout
    puts 'Pass - Holiday Employee logged out'
    puts 'Test complete for employee three'
  end

  def test_04_auto_approval_off_employee_new_leave_request
    puts 'Start test - Employee four creates absence record'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_auto_approval_employee_four
    puts 'Pass - Login as auto approval four'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).auto_approval_off_employee_new_leave_request
    puts 'Pass - opens add absence record'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).holiday_request_for_auto_approval
    puts 'Pass - creates absence which should be auto approved'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).auto_approval_off_employee_holiday_index
    if HolidayExtension.new(driver).booked_amount == '0.0 days'
      puts 'Pass - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
    if HolidayExtension.new(driver).available_amount == '20.0 days'
      puts 'Pass - available_amount total correct'
    else
      puts 'FAIL - available_amount total incorrect'
    end
    puts 'Pass - absence created, totals correct'
    LogoutExtension.new(driver).user_logout
    puts 'Pass - Holiday Employee logged out'
    puts 'Test complete for employee four'
  end

  def test_05_delete_absences_for_auto_approval_employee_one
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
    HolidayAutoApprovalExtension.new(driver).purge_holiday_data_auto_approval_employee_one
    puts 'Pass - absences purged'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).auto_approval_employee_one_holiday_index
    if HolidayExtension.new(driver).booked_amount == '0.0 days'
      puts 'Pass - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
    puts 'test complate - absences deleted for auto approval employee one'
  end

  def test_06_delete_absences_for_auto_approval_employee_two
    puts 'Start test to purge absence data'
    HolidayAutoApprovalExtension.new(driver).purge_holiday_data_auto_approval_employee_two
    puts 'Pass - absences purged'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).auto_approval_employee_two_holiday_index
    if HolidayExtension.new(driver).booked_amount == '0.0 days'
      puts 'Pass - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
    puts 'test complate - absences deleted for auto approval employee one'
  end

  def test_07_delete_absences_for_auto_approval_employee_three
    puts 'Start test to purge absence data'
    HolidayAutoApprovalExtension.new(driver).purge_holiday_data_auto_approval_employee_three
    puts 'Pass - absences purged'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).auto_approval_employee_three_holiday_index
    if HolidayExtension.new(driver).booked_amount == '0.0 days'
      puts 'Pass - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
    puts 'test complate - absences deleted for auto approval employee one'
  end

  def test_08_delete_absences_for_auto_approval_employee_four
    puts 'Start test to purge absence data'
    HolidayAutoApprovalExtension.new(driver).purge_holiday_data_auto_approval_employee_four
    puts 'Pass - absences purged'
    sleep 1
    HolidayAutoApprovalExtension.new(driver).auto_approval_off_employee_holiday_index
    if HolidayExtension.new(driver).booked_amount == '0.0 days'
      puts 'Pass - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
    puts 'test complate - absences deleted for auto approval employee one'
  end
end
# rubocop:enable Metrics/ClassLength
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
TestAutoApprovedHoliday.new.test_auto_approval_requests
