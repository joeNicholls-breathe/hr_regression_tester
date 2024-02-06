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
require './functions_library/navigate_around_app_manager'
require './functions_library/settings_config/company_holiday/company_holiday_extension'

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
  # that is on a company holiday
  # it will check for the taken and remaining totals being correct
  # and finish by deleting the absence and company holiday

  def test_leave_request
    puts 'Running - test_employee_holiday_company_holiday_clash.rb'
    test_01_create_company_holiday
    test_02_create_holiday_clash
    test_03_check_allowance_totals
    test_04_delete_records
    puts 'Complete - test_employee_holiday_company_holiday_clash.rb'
  end

  def test_01_create_company_holiday
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
    AppNavigationExtensionManager.new(driver).navigate_to_company_holidays
    puts 'Pass - Navigate to company holidays'
    sleep 1
    CompanyHolidaysExtension.new(driver).company_holiday_add
    puts 'Pass - Added company holiday'
    sleep 1
    puts 'Test 01 complete'
  end

  def test_02_create_holiday_clash
    puts 'Start test - Create absence that clashes with company holiday'
    HolidayExtension.new(driver).add_leave_request_for_holiday_employee
    puts 'Pass - opens add absence record'
    sleep 1
    LeaveRequestExtension.new(driver).employee_leave_request_today
    puts 'Pass - creates absence to clash with company holiday'
    sleep 1
    puts 'Test complete - Absence created that clashes with company holiday'
  end

  def test_03_check_allowance_totals
    puts 'Start test - Check totals'
    if HolidayExtension.new(driver).booked_amount == '0.5 days'
      puts 'Pass - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
    if HolidayExtension.new(driver).available_amount == '19.5 days'
      puts 'Pass - available_amount total correct'
    else
      puts 'FAIL - available_amount total incorrect'
    end
    sleep 1
    puts 'Test 02 complete - Absence does not remove allowance from employee'
  end

  def test_04_delete_records
    puts 'Start test - Deletes holiday and company holiday'
    HolidayExtension.new(driver).purge_holiday_data_holiday_employee
    puts 'Pass - purge holday data'
    sleep 1
    HolidayExtension.new(driver).holiday_employee_absence_index
    if HolidayExtension.new(driver).booked_amount == '0.0 days'
      puts 'Pass - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
    puts 'Test complete - Negative Carry-Over holiday deleted'
    if HolidayExtension.new(driver).available_amount == '20.0 days'
      puts 'Pass - available_amount total correct'
    else
      puts 'FAIL - available_amount total incorrect'
    end
    sleep 1
    AppNavigationExtensionManager.new(driver).navigate_to_company_holidays
    puts 'Pass - Navigate to company holidays'
    sleep 1
    CompanyHolidaysExtension.new(driver).company_holiday_delete
    puts 'Pass - deleted company holiday'
    sleep 1
    puts 'Test complete - Deleted holiday and company holiday'
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

TestLeaveRequest.new.test_leave_request
