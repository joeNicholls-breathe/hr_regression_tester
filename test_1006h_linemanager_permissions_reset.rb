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
    NavigationAroundAccountConfiguration.new(driver).navigate_to_change_what_line_managers_can_do
    puts '3. navigate to line settings - assign account settings to LM user'
    # remove all permissions
    # view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_personal_profile_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_leave_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_adjustments_and_toil_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_sickness_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_training_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_one_to_ones_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_objectives_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_deliverables_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_job_details_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_remuneration_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_emergency_contacts_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_medical_facts_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_personal_history_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_notes_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_equipment_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_id_documents_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_dbs_checks_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_grievances_and_disciplinaries_view
    LineManagerViewConfigExtension.new(driver).line_manager_configuration_on_time_logs_view
    # manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_profile_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_personal_profile_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_leave_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_adjustments_and_toil_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_sickness_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_training_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_one_to_ones_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_objectives_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_deliverables_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_job_details_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_remuneration_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_emergency_contacts_manage
    LineManagerManageConfigExtension.new(driver).ine_manager_configuration_on_medical_facts_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_personal_history_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_notes_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_equipment_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_id_documents_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_dbs_checks_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_grievances_and_disciplinaries_manage
    LineManagerManageConfigExtension.new(driver).line_manager_configuration_on_time_logs_manage
    # delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_profile_delete_docs_only
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_leave_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_sickness_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_training_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_one_to_ones_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_objectives_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_deliverables_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_job_details_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_remuneration_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_emergency_contacts_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_medical_facts_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_personal_history_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_notes_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_equipment_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_id_documents_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_dbs_checks_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_grievances_and_disciplinaries_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_time_logs_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_configurations_update
    puts '4. Permissions and approvals - Line manager can delete all employee areas'
    LineManagerConfigExtension.new(driver).navigate_back_to_settings_breadcrumb
    sleep 10
    puts 'Test 1006h complete'
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
AccountSetupLMUserReturnOriginStatus.new.test_1006h_linemanager_permisssions_reset
