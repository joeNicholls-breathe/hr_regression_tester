# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/test_reference_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/settings_config/account_config_navigation/account_configuration_navigation_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/ClassLength
class EmployeeInputs < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_employee_inputs
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).login_setup_acc_admin
    LoginAppExtension.new(driver).select_hr
    AppNavigationExtensionManager.new(driver).navigate_to_dashboard
    AppNavigationExtensionManager.new(driver).navigate_to_people_list
    AppNavigationExtensionManager.new(driver).navigate_to_people_screen_pill
    CreateEmployeeExtension.new(driver).create_employee_pending_starter_from_people_page #need to amend to make the employee start today???
    AppNavigationExtensionManager.new(driver).navigate_to_dashboard
    LogoutExtension.new(driver).
    puts '1. HR user adds a new employee joining today'
    puts '2. Employee login'
    puts "assign permissions to employee"
    sleep 10
    driver.close
  end
end
# rubocop:enable Metrics/ClassLength
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

EmployeeInputs.new.test_employee_inputs