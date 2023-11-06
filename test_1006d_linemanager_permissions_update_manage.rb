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
require './functions_library/settings_config/line_manager_config/line_manager_config_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class AccountSetupLMUserManage < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_line_manger_manage_permisssions_setup
    NavigateBrowserExtension.new(driver).breathe_login
    puts '1. navigate to breathe login url'
    LoginExtension.new(driver).login_setup_acc_admin
    LoginAppExtension.new(driver).select_hr
    puts '2. login'
    AppNavigationExtensionManager.new(driver).navigate_to_add_new_employee
    CreateEmployeeExtension.new(driver).create_line_manager_user
    puts 'add Line manager to account'
    CreateEmployeeExtension.new(driver).make_lm_user
    puts 'assign Line manager permissions to employee'
    AppNavigationExtensionManager.new(driver).navigate_to_settings_with_welcome_page_active
    NavigationAroundAccountConfiguration.new(driver).navigate_to_change_what_line_managers_can_do
    puts 'navigate to line settings - assign account settings to LM user'
    # manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_profile_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_personal_profile_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_leave_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_adjustments_and_toil_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_sickness_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_training_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_one_to_ones_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_objectives_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_deliverables_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_job_details_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_remuneration_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_emergency_contacts_manage
    LineManagerConfigExtension.new(driver).ine_manager_configuration_on_medical_facts_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_personal_history_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_notes_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_equipment_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_id_documents_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_dbs_checks_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_grievances_and_disciplinaries_manage
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_time_logs_manage
    LineManagerConfigExtension.new(driver).line_manager_configurations_update
    puts 'Permissions and approvals - Line manager can manage all employee areas'
    LineManagerConfigExtension.new(driver).navigate_back_to_settings_breadcrumb
    sleep 10
    puts 'Test 1006d complete'
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
AccountSetupLMUserManage.new.test_line_manger_manage_permisssions_setup
