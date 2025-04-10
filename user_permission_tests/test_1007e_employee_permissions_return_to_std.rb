# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/ui_page_element_check_extension'
require './functions_library/test_reference_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/sickness_extension'
require './functions_library/settings_config/account_config_navigation/account_configuration_navigation_extension'
require './functions_library/settings_config/employee_config/employee_config_extension'
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
class EmployeeInputs < Base
  attr_accessor :driver

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  def test_1007e_employee_permissions_return_to_std
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).login_setup_acc_admin
    LoginAppExtension.new(driver).select_hr
    NavigationAroundAccountConfiguration.new(driver).navigate_to_change_what_employees_can_do
    EmployeeConfigExtension.new(driver).employee_congifuration_what_can_see_custom_fields
    EmployeeConfigExtension.new(driver).employee_congifuration_what_can_do_update_profile_picture
    EmployeeConfigExtension.new(driver).employee_congifuration_update
    sleep 1
    # remove sickness from employee
    AppNavigationExtensionManager.new(driver).search_employee('Permissions Employee')
    sleep 1
    AppNavigationExtensionManager.new(driver).employee_profile_sickness_tab
    sleep 1
    SicknessExtension.new(driver).delete_sickness_record
    sleep 1
    driver.close
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
puts 'Test 1007e Employee permissions returned to standard state'
EmployeeInputs.new.test_1007e_employee_permissions_return_to_std
puts 'Test 1007e employee permissions returned to start state - COMPLETED - PASS'
