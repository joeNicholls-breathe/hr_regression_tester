# frozen_string_literal: true

require 'selenium-webdriver'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/holiday_extension'
require './functions_library/leave_request_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize

class TestLeaveRequest
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  # this will test an employee making a request, and an approver approving it
  # it will check for the taken and remaining totals being correct
  # and finish by deleting the absence and checking the totals
  # This test id for hoiliday employee id = 20717

  def test_leave_request_ignore_work_pattern
    puts 'Running - test_employee_holiday_ignore_working_pattern.rb'
    test_01_login_as_admin_and_create_record
    test_02_check_totals
    test_03_delete_holiday_data
    puts 'Complete - test_employee_holiday_ignore_working_pattern.rb'
  end

  def test_01_login_as_admin_and_create_record
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Start Test - Ignore work pattern adds total'
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_admin
    puts 'Pass - Login as admin'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Pass - Selects HR'
    sleep 1
    HolidayExtension.new(driver).employee_ignore_work_pattern_absence_index
    puts 'Pass - Navigate to holiday employee (ignore work pattern) absences'
    sleep 1
    HolidayExtension.new(driver).add_leave_request_for_ignore_work_pattern_employee
    puts 'Pass - Navigate to holiday employee (ignore work pattern) create absence'
    sleep 1
    LeaveRequestExtension.new(driver).employee_ignore_wp_holiday_record
    puts 'Pass - Create employee absence'
    sleep 1
  end

  def test_02_check_totals
    HolidayExtension.new(driver).employee_ignore_work_pattern_absence_index
    puts 'Pass - Navigate to holiday employee absences'
    if HolidayExtension.new(driver).booked_amount == '10.0 days'
      puts 'Pass - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
    if HolidayExtension.new(driver).available_amount == '10.0 days'
      puts 'Pass - available_amount total correct'
    else
      puts 'FAIL - available_amount total incorrect'
    end
    puts 'Test complete - Totals are correct'
  end

  def test_03_delete_holiday_data
    puts 'Start test - Deletes holiday information for employee'
    HolidayExtension.new(driver).purge_holiday_data('ignore WP holiday')
    puts 'Pass - Purge holday data'
    HolidayExtension.new(driver).employee_ignore_work_pattern_absence_index
    if HolidayExtension.new(driver).booked_amount == '0.0 days'
      puts 'Pass - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
    if HolidayExtension.new(driver).available_amount == '20.0 days'
      puts 'Pass - available_amount total correct'
    else
      puts 'FAIL - available_amount total incorrect'
    end
    puts 'Test complete - Ignore work pattern adds total'
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

TestLeaveRequest.new.test_leave_request_ignore_work_pattern
