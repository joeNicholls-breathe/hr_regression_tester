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
require './functions_library/settings_config/company_holiday/company_holiday_extension'
require './functions_library/people_page_extension'
require './functions_library/test_reference_extension'

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
  # that is on a company holiday
  # it will check for the taken and remaining totals being correct
  # and finish by deleting the absence and company holiday

  def test_leave_request
    puts 'Running - test_employee_holiday_company_holiday_clash.rb'
    test_01_create_company_holiday
    test_02_create_holiday_clash
    test_03_check_allowance_totals
    test_04_delete_absences
    driver.close
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
    AppNavigationExtensionManager.new(driver).navigate_to_people_list
    PeoplePageExtension.new(driver).select_employee_from_list('Holiday employee')
    AppNavigationExtensionManager.new(driver).open_employee_leave
    LeaveRequestExtension.new(driver).click_add_new_leave_request
    puts 'Pass - opens add absence record'
    LeaveRequestExtension.new(driver).employee_leave_request_today
    puts 'Pass - creates absence to clash with company holiday'
    sleep 1
    puts 'Test 02 complete - Absence created that clashes with company holiday'
  end

  def test_03_check_allowance_totals
    puts 'Start test - Check totals'
    sleep 1
    HolidayExtension.new(driver).compare_booked_amount('0.5 days')
    HolidayExtension.new(driver).compare_holiday_allowance('19.5 days')
    sleep 1
    puts 'Test 03 complete - Absence does not remove allowance from employee'
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
    sleep 1
    HolidayExtension.new(driver).purge_holiday_data('Holiday employee')
    puts 'Pass - absences purged'
    sleep 1
    AppNavigationExtensionManager.new(driver).navigate_to_company_holidays
    puts 'Pass - Navigate to company holidays'
    sleep 1
    CompanyHolidaysExtension.new(driver).company_holiday_delete
    puts 'Pass - deleted company holiday'
    sleep 2
    puts 'Test complete - Deleted holiday and company holiday'
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

TestLeaveRequest.new.test_leave_request
