# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/test_reference_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
class EmployeeExpensePermissions < Base
  attr_accessor :driver

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  def test_1010_expense_approver_testing
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).expenses_approver_employee_login
    LoginAppExtension.new(driver).select_hr
    AppNavigationExtensionManager.new(driver).navigate_to_dashboard
    puts 'can/not add'
    puts 'can/not edit'
    puts 'can/not delete'
    puts 'can approve'
    puts 'can reject'
    puts 'can navigate to reports to see expenses and claims'
    LogoutExtension.new(driver).user_logout
    driver.close
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
EmployeeExpensesPermissions.new.test_1010_expense_approver_testing
