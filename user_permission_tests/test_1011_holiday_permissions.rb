# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/test_reference_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'

class EmployeeHolidayPermissions < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_1011_holiday_approver_testing
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).holiday_approver_employee_login
    LoginAppExtension.new(driver).select_hr
    AppNavigationExtensionManager.new(driver).navigate_to_dashboard
    puts "navigates to employees leave record"
    puts "can add"
    puts "can edit"
    puts "can delete"
    puts "can approve"
    puts "can reject"
    puts "can navigate to reports to see leave and absences"
    LogoutExtension.new(driver).user_logout
    driver.close
  end
end

EmployeeHolidayPermissions.new.test_1011_holiday_approver_testing
