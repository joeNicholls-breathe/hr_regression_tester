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
require './functions_library/people_page_extension'
require './functions_library/test_reference_extension'

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength

class TestCancelledLeave # rubocop:disable Metrics/ClassLength
  attr_accessor :driver

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  def execute
    test_01_employee_makes_request
    test_02_approver_approves_request
    test_03_employee_requests_to_cancel_leave
    test_04_approver_approves_cancellation
  end

  def test_01_employee_makes_request
    puts 'Start test - Employee creates leave request'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'PASS - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_holiday_employee
    puts 'PASS - Login as employee'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'PASS - Selects HR'
    sleep 1
    EmployeeDashboardExtension.new(driver).click_widget('Request leave')
    puts 'PASS - Opens leave request'
    sleep 1
    LeaveRequestExtension.new(driver).employee_leave_request_in_two_weeks
    puts 'PASS - Completes leave request'
    sleep 3
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
    HolidayExtension.new(driver).holiday_employee_absence_index_requests
    puts 'PASS - Navigate to holiday employee absences'
    sleep 1
    HolidayExtension.new(driver).approve_leave_request
    puts 'PASS - Approve employee leave request'
    sleep 1
    HolidayExtension.new(driver).holiday_employee_absence_index
    puts 'PASS - Navigate to holiday employee absences'
    HolidayExtension.new(driver).compare_booked_amount('1.0 day')
    HolidayExtension.new(driver).compare_holiday_allowance('19.0 days')
    puts 'Test complete - Approver can approve holiday request'
  end

  def test_03_employee_requests_to_cancel_leave
    puts 'Start test - Employee creates leave request'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'PASS - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_holiday_employee
    puts 'PASS - Login as employee'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'PASS - Selects HR'
    sleep 1
    NavigateAroundAppEmployee.new(driver).navigate_to_leave_request_widget_manage_leave
    sleep 1
    LeaveRequestExtension.new(driver).make_cancellation_request
    status = LeaveRequestExtension.new(driver).find_request_status
    LeaveRequestExtension.new(driver).compare_request_status(status)
    HolidayExtension.new(driver).compare_booked_amount('1.0 day')
  end

  def test_04_approver_approves_cancellation
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
    HolidayExtension.new(driver).holiday_employee_absence_index_requests
    puts 'PASS - Navigate to holiday employee absences'
    sleep 1
    HolidayExtension.new(driver).approve_leave_request
    puts 'PASS - Approve employee leave request'
    sleep 1
    HolidayExtension.new(driver).holiday_employee_absence_index
    puts 'PASS - Navigate to holiday employee absences'
    HolidayExtension.new(driver).compare_booked_amount('0.0 days')
    HolidayExtension.new(driver).compare_holiday_allowance('20.0 days')
    puts 'Test complete - Approver can approve holiday request'
  end
end

TestCancelledLeave.new.execute

# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
