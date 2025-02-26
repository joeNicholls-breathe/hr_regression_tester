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
require './functions_library/ui_page_element_check_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/people_page_extension'
require './functions_library/holiday_auto_approval_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class TestLeaveRequest
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  # This will test an employee making a request, and an approver approving it
  # The employee will then make another request for the same day to make sure
  # the request is not generated and the user receives the correct message
  # It will finish by deleting the absence and checking the totals
  # This test id for hoiliday employee id = 20717

  def test_leave_request
    puts 'Running - test_employee_holiday_clash.rb'
    test_01_create_employee_holiday
    test_02_employee_makes_request_on_same_day
    test_03_employee_makes_request_overlapping_absence
    test_04_delete_holiday_data
    puts 'Complete - test_employee_holiday_clash.rb'
  end

  def test_01_create_employee_holiday
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
    # EmployeeDashboardExtension.new(driver).click_widget('Request leave')
    AppNavigationExtensionManager.new(driver).navigate_to_people_list
    PeoplePageExtension.new(driver).select_employee_from_list('Holiday employee')
    AppNavigationExtensionManager.new(driver).open_employee_leave
    LeaveRequestExtension.new(driver).click_add_new_leave_request
    puts 'Pass - opens add absence record'
    sleep 1
    LeaveRequestExtension.new(driver).employee_leave_request_in_two_weeks
    puts 'Pass - creates absence record for holiday employee'
    sleep 1
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
    puts 'Pass - Selects HR'
    sleep 1
    EmployeeDashboardExtension.new(driver).click_widget('Request leave')
    puts 'Pass - Opens leave request'
    sleep 1
    LeaveRequestExtension.new(driver).employee_leave_request_in_two_weeks
    puts 'Pass - requests leave request'
    sleep 1
    PageValueCheck.new(driver).leave_request_clashes_with_existing_absence
    sleep 1
    HolidayExtension.new(driver).holiday_employee_absence_index
    puts 'Pass - Navigate to holiday employee absences'
    HolidayExtension.new(driver).compare_booked_amount('1.0 day')
    HolidayExtension.new(driver).compare_holiday_allowance('19.0 days')
  end

  def test_03_employee_makes_request_overlapping_absence
    puts 'Start test 3 - Employee creates leave request'
    HolidayExtension.new(driver).holiday_employee_absence_index
    puts 'Pass- back to leave screen'
    LeaveRequestExtension.new(driver).click_add_new_leave_request
    puts 'Pass - Opens leave request'
    sleep 1
    LeaveRequestExtension.new(driver).employee_leave_request_overlapping_in_two_weeks
    puts 'Pass - requests leave request'
    sleep 1
    PageValueCheck.new(driver).leave_request_clashes_with_existing_absence
    sleep 1
    HolidayExtension.new(driver).holiday_employee_absence_index
    puts 'Pass - Navigate to holiday employee absences'
    HolidayExtension.new(driver).compare_booked_amount('1.0 day')
    HolidayExtension.new(driver).compare_holiday_allowance('19.0 days')
    LogoutExtension.new(driver).user_logout
    puts 'Pass - Holiday Employee logged out'
    puts 'TEST 3 complete - Absence not created that overlaps existing absence'
  end

  def test_04_delete_holiday_data
    puts 'Start test 4 - Deletes holiday information for employee'
    LoginExtension.new(driver).login_admin
    puts 'Pass - Login as admin'
    sleep 1
    HolidayExtension.new(driver).purge_holiday_data('Holiday employee')
    puts 'Pass - Purge holday data'
    HolidayExtension.new(driver).holiday_employee_absence_index
    HolidayExtension.new(driver).compare_booked_amount('0.0 days')
    HolidayExtension.new(driver).compare_holiday_allowance('20.0 days')
    puts 'Test complete - Holiday employees holiday deleted'
    puts 'Test 4 complete - absences deleted'
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

TestLeaveRequest.new.test_leave_request
