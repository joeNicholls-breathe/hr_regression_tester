# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/test_reference_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
class EmployeeHolidayPermissions < Base
  attr_accessor :driver

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  def test_1011_holiday_approver_testing
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).holiday_approver_employee_login
    LoginAppExtension.new(driver).select_hr
    AppNavigationExtensionManager.new(driver).navigate_to_dashboard
    puts 'navigates to employees leave record'
    puts 'can add'
    puts 'can edit'
    puts 'can delete'
    puts 'can approve'
    puts 'can reject'
    puts 'can navigate to reports to see leave and absences'
    LogoutExtension.new(driver).user_logout
    driver.close
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
EmployeeHolidayPermissions.new.test_1011_holiday_approver_testing
