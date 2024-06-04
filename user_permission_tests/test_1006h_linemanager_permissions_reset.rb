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
require './functions_library/settings_config/line_manager_config/line_manager_delete_extension'
require './functions_library/settings_config/line_manager_config/line_manager_manage_extension'
require './functions_library/settings_config/line_manager_config/line_manager_view_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class AccountSetupLMUserReturnOriginStatus < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_1006h_linemanager_permisssions_reset
    NavigateBrowserExtension.new(driver).breathe_login
    puts '1. navigate to breathe login url'
    LoginExtension.new(driver).login_setup_acc_admin
    LoginAppExtension.new(driver).select_hr
    puts '2. login'
    AppNavigationExtensionManager.new(driver).navigate_to_settings_with_welcome_page_active
    NavigationAroundAccountConfiguration.new(driver).navigate_to_change_what_line_managers_can_do
    puts '3.navigate to line settings - assign account settings to LM user'
    # remove all permissions
    # delete permissions removed
    LineManagerDeleteConfigExtension.new(driver).line_manager_profile_delete_docs_only
    LineManagerDeleteConfigExtension.new(driver).line_manager_leave_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_sickness_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_one_to_ones_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_objectives_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_deliverables_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_job_details_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_remuneration_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_onbarding_tasks
    LineManagerDeleteConfigExtension.new(driver).line_manager_able_to_see_their_peoples_people
    LineManagerDeleteConfigExtension.new(driver).line_manage_able_to_see_their_peoples_bank_details
    LineManagerDeleteConfigExtension.new(driver).line_manager_update
    sleep 1
    puts '4. permissions to delete removed'
    # manage permissions removed
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
    sleep 1
    puts '5. permissions to manage removed'
    # view permissions removed
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_leave_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_adjustments_and_toil_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_sickness_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_one_to_ones_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_objectives_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_deliverables_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_job_details_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_remuneration_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_company_tasks_view
    LineManagerViewConfigExtension.new(driver).line_manager_configurations_update
    sleep 1
    puts '6. permissions to view removed'
    AppNavigationExtensionLM.new(driver).reset_sickness_emp_return_to_work
    puts '7. Returns sickness of employee to status - Return to Work'
    sleep 1
    puts 'Test 1006h complete'
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
AccountSetupLMUserReturnOriginStatus.new.test_1006h_linemanager_permisssions_reset
