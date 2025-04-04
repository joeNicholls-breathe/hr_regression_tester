# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/ui_page_element_check_extension'
require './functions_library/test_reference_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/logout_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_employee_extension'
require './functions_library/sickness_extension'
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class EmployeePermissions < Base
  attr_accessor :driver

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    options.add_argument('--remote-debugging-port=9222')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  def test_1007d_employee_permissions_testing
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).login_auto_approval_permissions_employee
    puts '1. employee login'
    LoginAppExtension.new(driver).select_hr
    puts '2. navigate to HR'
    NavigateAroundAppEmployee.new(driver).navigate_to_profile
    NavigateAroundAppEmployee.new(driver).edit_profile_summary
    puts '3. edit profile summary - change request submitted'
    sleep 1
    NavigateAroundAppEmployee.new(driver).navigate_to_pay
    puts '4. access to view pay'
    sleep 1
    NavigateAroundAppEmployee.new(driver).navigate_to_benefits
    puts '5. access to view benefits'
    sleep 1
    NavigateAroundAppEmployee.new(driver).navigate_to_additional_payments
    puts '6. access to view additional payments'
    sleep 1
    NavigateAroundAppEmployee.new(driver).navigate_to_performance_onetoone
    NavigateAroundAppEmployee.new(driver).navigate_to_performance_objectives
    NavigateAroundAppEmployee.new(driver).navigate_to_performance_deliverables
    puts '7. access to view performance metrics'
    NavigateAroundAppEmployee.new(driver).navigate_to_custom_fields
    puts '8. access to view custom fields'
    NavigateAroundAppEmployee.new(driver).navigate_to_directory
    puts '9. access to view directory'
    NavigateAroundAppEmployee.new(driver).navigate_to_calendar
    puts '10. access to view calendar'
    NavigateAroundAppEmployee.new(driver).navigate_to_holidays
    NavigateAroundAppEmployee.new(driver).request_toil
    puts '11. request TOIL'
    sleep 1
    NavigateAroundAppEmployee.new(driver).open_sickness_new
    SicknessExtension.new(driver).employee_sickness_create
    puts '12. request sickness - form'
    sleep 1
    NavigateAroundAppEmployee.new(driver).open_request_onetoeone_new
    NavigateAroundAppEmployee.new(driver).one_to_one_request
    puts '13. request one to one - dashboard'
    sleep 3
    LogoutExtension.new(driver).user_logout
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
EmployeePermissions.new.test_1007d_employee_permissions_testing
puts 'Test 1007d employee permissions test with all perms enabled - COMPLETED - PASS'
