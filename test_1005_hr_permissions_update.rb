# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/ui_page_element_check'
require './functions_library/test_reference_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_manager'
require './functions_library/settings_config/account_config_navigation/account_configuration_navigation_extension'
require './functions_library/settings_config/hr_user_config/hr_user_config_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class AccountSetupHRUser < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_hr_user_setup
    NavigateBrowserExtension.new(driver).breathe_login
    puts '1. navigate to breathe login url'
    LoginExtension.new(driver).login_setup_acc_admin
    LoginAppExtension.new(driver).select_hr
    puts '2. login'
    puts 'add HR to account'
    puts 'assign HR permissions to employee'
    puts 'navigate to HR settings - assign account settings to HR user'
    AccountConfigExtension.new(driver).hr_user_configuration_leave_needs_approval_on
    AccountConfigExtension.new(driver).hr_user_configuration_use_gravatar_on
    AccountConfigExtension.new(driver).hr_user_configuration_disable_welcome_page_on
    AccountConfigExtension.new(driver).hr_user_configuration_use_bradford_factor_on
    AccountConfigExtension.new(driver).hr_user_configuration_remind_line_manager_to_give_121_on
    AccountConfigExtension.new(driver).hr_user_configuration_grapevine_label
    AccountConfigExtension.new(driver).update_hr_settings
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb
    puts 'Permissions and approvals - check what people can do - HR user'
    sleep 10
    driver.close
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength

AccountSetupHRUser.new.test_hr_user_setup
