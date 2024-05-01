# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/ui_page_element_check'
require './functions_library/test_reference_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_manager'
require './functions_library/settings_config/2FA/2fa_extension'
require './functions_library/settings_config/account_config_navigation/account_configuration_navigation_extension'
require './functions_library/settings_config/line_manager_config/line_manager_manage_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class AccountSetupLMUserManage < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_1006d_linemanger_permisssions_update_manage
    NavigateBrowserExtension.new(driver).breathe_login
    puts '1. navigate to breathe login url'
    LoginExtension.new(driver).login_setup_acc_admin
    LoginAppExtension.new(driver).select_hr
    puts '2. login'
    AppNavigationExtensionManager.new(driver).navigate_to_settings_with_welcome_page_active
    NavigationAroundAccountConfiguration.new(driver).navigate_to_change_what_line_managers_can_do
    puts '3. navigate to line settings - assign account settings to LM user'
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_profile_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_leave_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_adjustments_and_toil_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_sickness_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_one_to_ones_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_objectives_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_deliverables_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_job_details_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_remuneration_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_onboarding_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configurations_update
    puts '4. permissions and approvals - Line manager can manage employee areas'
    sleep 3
    puts 'Test 1006d complete'
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
AccountSetupLMUserManage.new.test_1006d_linemanger_permisssions_update_manage
