# frozen_string_literal: true

require 'selenium-webdriver'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/logout_extension'
require './functions_library/login_app_extension'
require './functions_library/employee_dashboard_extension'
require './functions_library/holiday_extension'
require './functions_library/sickness_extension'
require './functions_library/leave_request_extension'
require './functions_library/navigate_around_app_employee'
require './functions_library/ui_page_element_check'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/ClassLength
# rubocop:disable Metrics/AbcSize
class TestLeaveRequest
  attr_accessor :driver

  # this will test an employee making a holiday request when they already
  # have a sickness record - both on the same day and overlapping the
  # sickness record
  # it will check that the leave record is not created
  # and the totals are not updated
  # then finish by deleting the sickness record

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_leave_sickness_request
    puts 'Running - test_employee_holiday_process.rb'
    test_01_create_employee_sickness
    test_02_employee_makes_request_on_same_day
    test_03_employee_makes_request_overlapping_absence
    test_04_delete_holiday_and_sickness_data
    puts 'Complete - test_employee_holiday_process.rb'
  end

  def test_01_create_employee_sickness
    puts 'Start test - Admin creates sickness record'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_admin
    puts 'Pass - Login as admin'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Pass - Selects HR'
    sleep 1
    SicknessExtension.new(driver).create_sickness_data_holiday_employee
    puts 'Pass - opens add sickness record'
    sleep 1
    SicknessExtension.new(driver).employee_sickness_create
    puts 'Pass - creates sickness record for holiday employee'
    sleep 1
    SicknessExtension.new(driver).holiday_employee_sickness_index
    puts 'pass - navigates to employee sickness screen'
    LogoutExtension.new(driver).logout_admin
    puts 'TEST 01 complete'
  end

  def test_02_employee_makes_request_on_same_day
    puts 'Start test 2 - Employee creates leave request'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_holiday_employee
    puts 'Pass - Login as employee'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Pass - Selects HR" '
    sleep 1
    EmployeeDashboardExtension.new(driver).make_holiday_request
    puts 'Pass - Opens leave request'
    sleep 1
    LeaveRequestExtension.new(driver).employee_leave_request_in_two_weeks
    puts 'Pass - requests leave request'
    sleep 1
    PageValueCheck.new(driver).leave_request_clashes_with_existing_absence
    sleep 1
    HolidayExtension.new(driver).holiday_employee_absence_index
    puts 'Pass - Navigate to holiday employee absences'
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
    puts 'TEST 02 complete'
  end

  def test_03_employee_makes_request_overlapping_absence
    puts 'Start test 3 - Employee creates leave request'
    HolidayExtension.new(driver).holiday_employee_absence_index
    puts 'Pass- back to leave screen'
    HolidayExtension.new(driver).add_leave_request_for_holiday_employee
    puts 'Pass - Opens leave request'
    sleep 1
    LeaveRequestExtension.new(driver).employee_leave_request_overlapping_in_two_weeks
    puts 'Pass - requests leave request'
    sleep 1
    PageValueCheck.new(driver).leave_request_clashes_with_existing_absence
    sleep 1
    HolidayExtension.new(driver).holiday_employee_absence_index
    puts 'Pass - Navigate to holiday employee absences'
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
    LogoutExtension.new(driver).user_logout
    puts 'Pass - Holiday Employee logged out'
    puts 'TEST 03 complete'
  end

  def test_04_delete_holiday_and_sickness_data
    puts 'Start test 4 - Deletes holiday and sickness information for employee'
    LoginExtension.new(driver).login_admin
    puts 'Pass - Login as admin'
    sleep 1
    SicknessExtension.new(driver).holiday_employee_sickness_index
    puts 'navigates to sickness index'
    sleep 1
    SicknessExtension.new(driver).delete_sickness_record
    puts 'deletes sickness record'
    sleep 1
    HolidayExtension.new(driver).purge_holiday_data_holiday_employee
    puts 'Pass - Purge holday data'
    HolidayExtension.new(driver).holiday_employee_absence_index
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
    puts 'Test complete - Holiday employees holiday deleted'
    puts 'Test 4 complete - absences deleted'
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/ClassLength
# rubocop:enable Metrics/AbcSize

TestLeaveRequest.new.test_leave_sickness_request
