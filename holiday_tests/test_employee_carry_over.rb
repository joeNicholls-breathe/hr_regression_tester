# frozen_string_literal: true

require 'selenium-webdriver'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/logout_extension'
require './functions_library/login_app_extension'
require './functions_library/employee_dashboard_extension'
require './functions_library/holiday_extension'
require './functions_library/leave_request_extension'
require './functions_library/navigate_around_app_employee'
require './functions_library/test_reference_extension'

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
  # that uses their carry over amount
  # it will check for the taken and remaining totals being correct
  # and also the carry over amount
  # and finish by deleting the absence and checking the totals

  def test_leave_request
    puts 'Running - test_employee_holiday_carry_over.rb'
    test_01_employee_makes_request
    test_02_check_allowance_totals
    test_03_delete_holiday_data
    puts 'Complete - test_employee_holiday_carry_over.rb'
  end

  def test_01_employee_makes_request
    puts 'Start test - Employee creates leave request'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_admin
    puts 'Pass - Login as admin'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Pass - Selects HR'
    sleep 1
    HolidayExtension.new(driver).add_leave_request_for_carry_over_employee
    puts 'Pass - opens add absence record'
    sleep 1
    LeaveRequestExtension.new(driver).employee_holiday_leave_request_last_year
    puts 'Pass - creates absence last year to create carry over period'
    sleep 1
    HolidayExtension.new(driver).add_leave_request_for_carry_over_employee
    puts 'Pass - opens add absence record'
    sleep 1
    LeaveRequestExtension.new(driver).employee_holiday_leave_in_carry_over
    puts 'Pass - creates absence in carry over period'
    sleep 1
  end

  def test_02_check_allowance_totals
    puts 'Start test - Check totals'
    if HolidayExtension.new(driver).booked_amount == '1.0 day'
      puts 'Pass - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
    if Time.now.utc.strftime('%d/%m/%Y') < '31/03/2024'
      puts 'Holiday year after carry over period'
      after_carry_over_period
    else
      puts 'Holiday year within carry over period'
      during_carry_over_period
    end
    puts 'Test complete - Approver can approve holiday request'
  end

  def after_carry_over_period
    if HolidayExtension.new(driver).available_amount == '20.0 days'
      puts 'Pass - available_amount total correct'
    else
      puts 'FAIL - available_amount total incorrect'
    end
  end

  def during_carry_over_period
    if HolidayExtension.new(driver).available_amount == '24.0 days'
      puts 'Pass - available_amount total correct'
    else
      puts 'FAIL - available_amount total incorrect'
    end
  end

  def test_03_delete_holiday_data
    puts 'Start test - Deletes holiday information for carry over employee'
    HolidayExtension.new(driver).purge_holiday_data_for_carry_over_employee
    puts 'Pass - purge holday data'
    HolidayExtension.new(driver).holiday_employee_absence_index
    if HolidayExtension.new(driver).booked_amount == '0.0 days'
      puts 'Pass - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
    puts 'Test complete - Holiday employees holiday deleted'
    if HolidayExtension.new(driver).available_amount == '20.0 days'
      puts 'Pass - available_amount total correct'
    else
      puts 'FAIL - available_amount total incorrect'
    end
    puts 'Test complete - Holiday employees holiday deleted'
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

TestLeaveRequest.new.test_leave_request
