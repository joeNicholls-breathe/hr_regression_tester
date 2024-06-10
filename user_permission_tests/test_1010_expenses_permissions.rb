# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/test_reference_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'

class EmployeeExpensePermissions < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_1010_expense_approver_testing
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).expenses_approver_employee_login
    LoginAppExtension.new(driver).select_hr
    AppNavigationExtensionManager.new(driver).navigate_to_dashboard
    puts "can/not add"
    puts "can/not edit"
    puts "can/not delete"
    puts "can approve"
    puts "can reject"
    puts "can navigate to reports to see expenses and claims"
    LogoutExtension.new(driver).user_logout
    driver.close
  end
end

EmployeeExpensesPermissions.new.test_1010_expense_approver_testing
