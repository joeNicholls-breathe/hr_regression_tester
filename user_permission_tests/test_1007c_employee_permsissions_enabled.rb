# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/ui_page_element_check'
require './functions_library/test_reference_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/settings_config/account_config_navigation/account_configuration_navigation_extension'
require './functions_library/settings_config/employee_config/employee_config_extension'
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class EmployeeInputs < Base
  attr_accessor :driver

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  def test_1007c_employee_permissions_enabled
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).login_setup_acc_admin
    LoginAppExtension.new(driver).select_hr
    NavigationAroundAccountConfiguration.new(driver).navigate_to_change_what_employees_can_do
    EmployeeConfigExtension.new(driver).employee_congifuration_what_can_see_remunerations
    EmployeeConfigExtension.new(driver).employee_congifuration_what_can_see_performance_metrics
    EmployeeConfigExtension.new(driver).employee_congifuration_what_can_see_custom_fields
    EmployeeConfigExtension.new(driver).employee_congifuration_what_can_see_directory
    EmployeeConfigExtension.new(driver).employee_congifuration_what_can_see_calendar
    EmployeeConfigExtension.new(driver).employee_congifuration_what_can_do_update_profile_picture
    EmployeeConfigExtension.new(driver).employee_congifuration_what_can_do_request_toil
    EmployeeConfigExtension.new(driver).employee_congifuration_what_can_do_report_sickness
    EmployeeConfigExtension.new(driver).employee_congifuration_what_can_do_request_one_to_ones
    EmployeeConfigExtension.new(driver).employee_congifuration_update
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
EmployeeInputs.new.test_1007c_employee_permissions_enabled
puts 'Test 1007c COMPLETED - PASS'
