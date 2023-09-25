require 'selenium-webdriver'
require 'logger'
require './functions_library/ui_page_element_check.rb'
require './functions_library/test_reference_extension.rb'
require './functions_library/navigate_browser_extension.rb'
require './functions_library/login_extension.rb'
require './functions_library/login_app_extension.rb'
require './functions_library/navigate_around_app_manager.rb'
require './functions_library/settings_config/account_config_navigation/account_configuration_navigation_extension.rb'
require './functions_library/settings_config/hr_user_config/hr_user_config_extension.rb'

class AccountSetupHRUser < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_hr_user_setup
    AccountConfigExtension.new(driver).hr_user_configuration_leave_needs_approval_on
    AccountConfigExtension.new(driver).hr_user_configuration_use_gravatar_on
    AccountConfigExtension.new(driver).hr_user_configuration_disable_welcome_page_on
    AccountConfigExtension.new(driver).hr_user_configuration_use_bradford_factor_on
    AccountConfigExtension.new(driver).hr_user_configuration_remind_line_manager_to_give_121_on
    AccountConfigExtension.new(driver).hr_user_configuration_grapevine_label
    AccountConfigExtension.new(driver).update_hr_settings
    AccountConfigExtension.new(driver).navigate_back_to_settings_breadcrumb
    puts "Permissions and approvals - check what people can do - HR user"
    sleep 10
    driver.close
  end
end

AccountSetupHRUser.new.test_hr_user_setup