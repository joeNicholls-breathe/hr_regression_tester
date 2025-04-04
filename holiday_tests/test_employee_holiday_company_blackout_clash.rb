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
require './functions_library/settings_config/company_blackouts/company_blackouts_extension'
require './functions_library/test_reference_extension'
require './functions_library/ui_page_element_check_extension'
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
  # that is on a company blackout

  def test_leave_request
    puts 'Running - test_employee_holiday_company_blackout_clash.rb'
    test_01_create_company_blackout
    test_02_create_holiday_clash
    test_03_check_allowance_totals
    test_04_create_holiday_overrides_clash
    test_05_check_allowance_totals
    test_06_delete_records
    driver.close
    puts 'Complete - test_employee_holiday_company_blackout_clash.rb'
  end

  def test_01_create_company_blackout
    puts 'START test 01 - Employee creates leave request'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_admin
    puts 'Pass - Login as admin'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Pass - Selects HR'
    sleep 1
    AppNavigationExtensionManager.new(driver).navigate_to_company_blackouts
    puts 'Pass - Navigate to company blackouts'
    sleep 2
    # binding.pry
    CompanyBlackoutsExtension.new(driver).company_blackout_add_new
    puts 'Pass - Added company blackout'
    puts 'TEST 01 complete'
  end

  def test_02_create_holiday_clash
    puts 'START test 02 - Create absence that clashes with company blackout'
    AppNavigationExtensionManager.new(driver).navigate_to_people_list
    sleep 2
    PeoplePageExtension.new(driver).select_employee_from_list('Holiday employee')
    AppNavigationExtensionManager.new(driver).open_employee_leave
    LeaveRequestExtension.new(driver).click_add_new_leave_request
    puts 'Pass - opens add absence record'
    LeaveRequestExtension.new(driver).employee_leave_request_in_two_weeks
    puts 'Pass - creates absence to clash with company blackout'
    PageValueCheck.new(driver).leave_request_clashes_with_blackout_check
    puts 'TEST 02 complete - Absence not created that clashes with company blackout'
  end

  def test_03_check_allowance_totals
    puts 'START test 03 - Check totals'
    HolidayExtension.new(driver).holiday_employee_absence_index
    HolidayExtension.new(driver).compare_booked_amount('0.0 days')
    HolidayExtension.new(driver).compare_holiday_allowance('20.0 days')
    puts 'TEST 03 complete - No absences to change allowance'
  end

  def test_04_create_holiday_overrides_clash
    puts 'START test 04 - Create absence that clashes with company blackout'
    AppNavigationExtensionManager.new(driver).navigate_to_people_list
    PeoplePageExtension.new(driver).select_employee_from_list('Holiday employee')
    AppNavigationExtensionManager.new(driver).open_employee_leave
    LeaveRequestExtension.new(driver).click_add_new_leave_request
    puts 'Pass - opens add absence record'
    LeaveRequestExtension.new(driver).employee_leave_request_in_two_weeks
    puts 'Pass - creates absence to clash with company blackout'
    sleep 2
    LeaveRequestExtension.new(driver).employee_leave_request_overides_blackout
    puts 'Pass - creates absence that overrides company blackout'
    puts 'TEST 04 complete'
  end

  def test_05_check_allowance_totals
    puts 'START test 05 - Check totals'
    HolidayExtension.new(driver).holiday_employee_absence_index
    HolidayExtension.new(driver).compare_booked_amount('1.0 day')
    HolidayExtension.new(driver).compare_holiday_allowance('19.0 days')
    puts 'TEST 05 complete - Absence does not remove allowance from employee'
  end

  def test_06_delete_records
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
    AppNavigationExtensionManager.new(driver).navigate_to_data
    AppNavigationExtensionManager.new(driver).open_purge_data
    HolidayExtension.new(driver).purge_holiday_data('Holiday employee')
    puts 'Pass - absences purged'
    sleep 1
    AppNavigationExtensionManager.new(driver).navigate_to_company_blackouts
    puts 'Pass - Navigate to company blackouts'
    sleep 3
    CompanyBlackoutsExtension.new(driver).company_blackout_delete
    puts 'Pass - deleted company blackout'
    puts 'TEST 06 complete - Deleted blackout and company blackout'
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

TestLeaveRequest.new.test_leave_request
