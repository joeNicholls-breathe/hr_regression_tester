# frozen_string_literal: true

require 'selenium-webdriver'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/logout_extension'
require './functions_library/login_app_extension'
require './functions_library/employee_dashboard_extension'
require './functions_library/employee_profile_extension'
require './functions_library/holiday_extension'
require './functions_library/leave_request_extension'
require './functions_library/navigate_around_app_employee_extension'
require './functions_library/navigate_around_app_manager_extension'
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

  # this will test an employee making a request, and an approver approving it
  # it will check for the taken and remaining totals being correct
  # and finish by deleting the absence and checking the totals
  # This test id for hoiliday employee id = 20717

  def test_leave_request
    puts 'Running - test_employee_hourly_holiday_process.rb'
    test_01_employee_makes_request
    test_02_approver_approves_request
    test_03_delete_absences
    driver.close
    puts 'Complete - test_employee_hourly_holiday_process.rb'
  end

  def test_01_employee_makes_request
    puts 'Start test - Employee creates leave request'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'PASS - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_hourly_holiday_employee
    puts 'PASS - Login as employee'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'PASS - Selects HR'
    sleep 1
    EmployeeDashboardExtension.new(driver).click_widget('Request leave')
    puts 'PASS - Opens leave request'
    sleep 1
    LeaveRequestExtension.new(driver).make_leave_request('16/12/2025', '16/12/2025')
    puts 'PASS - Completes leave request'
    sleep 2
    NavigateAroundAppEmployee.new(driver).navigate_to_leave_request_widget_manage_leave
    puts 'PASS - Displays leave request'
    sleep 1
    LogoutExtension.new(driver).user_logout
    puts 'PASS - Holiday Employee logged out'
    puts 'Test complete - Employee creates leave request'
  end

  def test_02_approver_approves_request
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Start Test - Holiday approver approves request'
    puts 'PASS - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_admin
    puts 'PASS - Login as admin'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'PASS - Selects HR'
    sleep 1
    AppNavigationExtensionManager.new(driver).navigate_to_people_list
    sleep 1
    PeoplePageExtension.new(driver).select_employee_from_list('Hourly Employee')
    sleep 1
    EmployeeProfileExtension.new(driver).open_employee_leave
    puts 'PASS - Navigate to hourly employee absences'
    sleep 1
    HolidayExtension.new(driver).approve_leave_request
    puts 'PASS - Approve employee leave request'
    HolidayExtension.new(driver).compare_booked_amount('7h 30m')
    HolidayExtension.new(driver).compare_holiday_allowance('92h 30m')
    puts 'Test complete - Approver can approve holiday request'
  end

  def test_03_delete_absences
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Start Test - Holiday approver approves request'
    puts 'PASS - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_admin
    puts 'PASS - Login as admin'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'PASS - Selects HR'
    sleep 1
    AppNavigationExtensionManager.new(driver).open_purge_from_url
    sleep 1
    HolidayExtension.new(driver).purge_holiday_data('Hourly Employee')
    sleep 1
    puts 'PASS - absences purged'
    puts 'test complete - absences purged'
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

TestLeaveRequest.new.test_leave_request
