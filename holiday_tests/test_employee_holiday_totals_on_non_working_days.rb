# frozen_string_literal: true

require 'selenium-webdriver'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/logout_extension'
require './functions_library/login_app_extension'
require './functions_library/employee_dashboard_extension'
require './functions_library/holiday_extension'
require './functions_library/leave_request_extension'
require './functions_library/navigate_around_app_employee_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class TestLeaveRequest
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    # driver.manage.timeout.implicit_wait = 3
    Selenium::WebDriver.logger.level = :info
  end

  # this will test an employee making a request, for a non working day
  # it will check that no time is taken from the allowance
  # and finish by deleting the absence and checking the totals

  def test_leave_request
    puts 'Running - test_employee_holiday_totals_on_non_working_days.rb'
    test_01_employee_makes_request
    test_02_approver_approves_request
    test_03_delete_holiday_data
    puts 'Complete - test_employee_holiday_totals_on_non_working_days.rb'
  end

  def test_01_employee_makes_request
    puts 'Start test - Employee creates leave request'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_holiday_employee
    puts 'Pass - Login as employee'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Pass - Selects HR'
    sleep 1
    EmployeeDashboardExtension.new(driver).click_widget('Request leave')
    puts 'Pass - Opens leave request'
    sleep 1
    # Has to be on a weekend/non-working day
    LeaveRequestExtension.new(driver).make_leave_request_half_day('28/12/2025', '28/12/2025')
    puts 'Pass - Completes leave request'
    sleep 1
    EmployeeDashboardExtension.new(driver).open_employee_holiday
    puts 'Pass - Displays leave request'
    sleep 1
    LogoutExtension.new(driver).user_logout
    puts 'Pass - Holiday Employee logged out'
    puts 'Test complete - Employee creates leave request'
  end

  def test_02_approver_approves_request
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
    HolidayExtension.new(driver).holiday_employee_absence_index_requests
    puts 'Pass - Navigate to holiday employee absences'
    sleep 1
    HolidayExtension.new(driver).approve_leave_request
    puts 'Pass - approve employee leave request'
    sleep 1
    HolidayExtension.new(driver).holiday_employee_absence_index
    puts 'Pass - Navigate to holiday employee absences'
    HolidayExtension.new(driver).compare_booked_amount('0.0 days')
    HolidayExtension.new(driver).compare_holiday_allowance('20.0 days')
    puts 'Test complete - Approver can approve holiday request'
  end

  def test_03_delete_holiday_data
    puts 'Start test - Deletes holiday information for employee'
    HolidayExtension.new(driver).purge_holiday_data('Holiday employee')
    puts 'Pass - purge holday data'
    HolidayExtension.new(driver).holiday_employee_absence_index
    HolidayExtension.new(driver).compare_booked_amount('0.0 days')
    HolidayExtension.new(driver).compare_holiday_allowance('20.0 days')
    puts 'Test complete - Holiday employees holiday deleted'
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
TestLeaveRequest.new.test_leave_request
