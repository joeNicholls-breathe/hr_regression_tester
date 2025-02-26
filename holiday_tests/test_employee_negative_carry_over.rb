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

  # this will test an employee making a holiday request
  # that uses their negative carry over amount
  # it will check for the taken and remaining totals being correct
  # and also the carry over amount
  # and finish by deleting the absence and checking the totals

  def test_leave_request
    puts 'Running - test_employee_holiday_negative_carry_over.rb'
    test_01_employee_makes_request
    test_02_check_allowance_totals
    test_03_delete_holiday_data
    puts 'Complete - test_employee_holiday_negative_carry_over.rb'
  end

  def test_01_employee_makes_request
    puts 'Start test - Employee creates leave request'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_negative_carry_over_holiday_employee
    puts 'Pass - Login as negative carryover employee'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Pass - Selects HR'
    sleep 1
    EmployeeDashboardExtension.new(driver).click_widget('Request leave')
    puts 'Pass - opens add absence record'
    sleep 1
    LeaveRequestExtension.new(driver).make_leave_request('13/10/2025', '24/10/2025')
    puts 'Pass - creates absence to use this years allowance'
    sleep 1
    EmployeeDashboardExtension.new(driver).click_widget('Request leave')
    puts 'Pass - opens add absence record'
    sleep 1
    LeaveRequestExtension.new(driver).make_leave_request('17/11/2025', '22/11/2025')
    puts 'Pass - creates absence in this year to use next years allowance'
    sleep 1
  end

  def test_02_check_allowance_totals
    puts 'Start test - Check totals'
    EmployeeDashboardExtension.new(driver).open_employee_holiday
    HolidayExtension.new(driver).compare_booked_amount('15.0 days')
    HolidayExtension.new(driver).compare_holiday_allowance('0.0 days')
    puts 'Test complete - Approver can approve holiday request'
    LogoutExtension.new(driver).user_logout
  end

  def test_03_delete_holiday_data
    puts 'Start test - Deletes holiday information for Negative carry over employee'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_admin
    puts 'Pass - Login as admin'
    HolidayExtension.new(driver).purge_holiday_data('Negative Carry-Over')
    puts 'Pass - purge holday data'
    HolidayExtension.new(driver).negative_carry_over_holiday_employee_absence_index
    HolidayExtension.new(driver).compare_booked_amount('0.0 days')
    HolidayExtension.new(driver).compare_holiday_allowance('10.0 days')
    puts 'Test complete - Negative Carry-Over holiday deleted'
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

TestLeaveRequest.new.test_leave_request
