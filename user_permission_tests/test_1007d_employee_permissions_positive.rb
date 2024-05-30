# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/test_reference_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'

class EmployeePermissions < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_1007d_employee_permissions_testing
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).employee_login
    LoginAppExtension.new(driver).select_hr
    AppNavigationExtensionManager.new(driver).navigate_to_dashboard
    LogoutExtension.new(driver).user_logout
    puts 'employee login'
    puts 'navigate to HR'
    puts 'access to view pay'
    puts 'access to view benefits'
    puts 'access to view additional payments'
    puts 'access to view performance metrics'
    puts 'access to view custom fields'
    puts 'access to view directory'
    puts 'access to view calendar'
    puts 'request TOIL'
    puts 'request sickness - dashboard'
    puts 'request one to one - dashboard'
    driver.close
  end
end

EmployeePermissions.new.test_1007d_employee_permissions_testing
