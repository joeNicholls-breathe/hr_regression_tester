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

class TestLeaveRequest
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    # driver.manage.timeout.implicit_wait = 3
    Selenium::WebDriver.logger.level = :info
  end

  # this will test an employee making a holiday request when they already
  # have a sickness record
  # it will check that the leave record is not created
  # and the totals are not updated
  # then finish by deleting the sickness record

  def test_create_sickness_record
    puts 'Running - test_employee_holiday_two_years.rb'

    puts 'Complete - test_employee_holiday_two_years.rb'
  end

  def test_01_add_sickness_record
    puts 'Start test - Employee creates leave request'

    puts 'Test complete - Employee creates two leave requests'
  end

  def test_02_add_leave_request
    puts 'Start test - Employee tries to create a leave request'

    puts 'Test complete - Employee can not add leave request'
  end

  def test_03_delete_sickness_data
    puts 'Start test - Deletes sickness information for employee'

    puts 'Test complete - sickness record deleted for employee'
  end
end

TestLeaveRequest.new.test_leave_request
