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
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/test_reference_extension'
require './functions_library/people_page_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class TestLeaveRequest
  attr_accessor :driver

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
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
    test_03_delete_absences
    driver.close
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
    LeaveRequestExtension.new(driver).make_leave_request('29/12/2024', '29/12/2024')
    puts 'Pass - creates absence last year to create carry over period'
    sleep 1
    HolidayExtension.new(driver).add_leave_request_for_carry_over_employee
    puts 'Pass - opens add absence record'
    sleep 1
    LeaveRequestExtension.new(driver).make_leave_request('06/01/2025', '06/01/2025')
    puts 'Pass - creates absence in carry over period'
    sleep 1
  end

  def test_02_check_allowance_totals
    puts 'Start test - Check totals'
    sleep 2
    HolidayExtension.new(driver).compare_booked_amount('1.0 day')
    target_date = Date.new(2025, 3, 31) # Year, month, day
    today = Date.today
    if today > target_date
      puts 'Holiday year after carry over period'
      HolidayExtension.new(driver).compare_holiday_allowance('20.0 days')
    else
      puts 'Holiday year within carry over period'
      HolidayExtension.new(driver).compare_holiday_allowance('24.0 days')
    end
    puts 'Test complete - Approver can approve holiday request'
  end

  def test_03_delete_absences
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
    sleep 1
    HolidayExtension.new(driver).purge_holiday_data('Carry-over Employee')
    sleep 2
    puts 'Pass - absences purged'
    puts 'test complete - absences deleted for Carry-over employee'
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

TestLeaveRequest.new.test_leave_request
