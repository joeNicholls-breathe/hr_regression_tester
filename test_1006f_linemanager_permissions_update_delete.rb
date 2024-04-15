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
require './functions_library/settings_config/line_manager_config/line_manager_delete_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class AccountSetupLMUserDelete < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_1006f_linemanger_permisssions_update_delete
    NavigateBrowserExtension.new(driver).breathe_login
    puts '1. navigate to breathe login url'
    LoginExtension.new(driver).login_setup_acc_admin
    LoginAppExtension.new(driver).select_hr
    puts '2. login'
    AppNavigationExtensionManager.new(driver).navigate_to_settings_with_welcome_page_active
    NavigationAroundAccountConfiguration.new(driver).navigate_to_change_what_line_managers_can_do
    puts '3.navigate to line settings - assign account settings to LM user'
    # std delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_profile_delete_docs_only
    LineManagerDeleteConfigExtension.new(driver).line_manager_leave_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_sickness_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_one_to_ones_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_objectives_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_deliverables_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_job_details_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_remuneration_delete
    LineManagerDeleteConfigExtension.new(driver).line_manager_onbarding_tasks
    # enhanced account permissions
    # LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_emergency_contacts_delete
    # LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_medical_facts_delete
    # LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_personal_history_delete
    # LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_notes_delete
    # LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_equipment_delete
    # LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_id_documents_delete
    # LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_dbs_checks_delete
    # LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_grievances_and_disciplinaries_delete
    # LineManagerDeleteConfigExtension.new(driver).line_manager_configuration_on_time_logs_delete
    # Add line manager view of peoples, people and bank details
    LineManagerDeleteConfigExtension.new(driver).line_manager_update
    puts '4. permissions and approvals - Line manager can delete all employee areas'
    LineManagerDeleteConfigExtension.new(driver).line_manager_able_to_see_their_peoples_people
    LineManagerDeleteConfigExtension.new(driver).line_manage_able_to_see_their_peoples_bank_details
    LineManagerDeleteConfigExtension.new(driver).line_manager_update
    puts '5. permissions and approvals - Line manager has all access to personal profile details'
    sleep 5
    puts 'Test 1006f complete'
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
AccountSetupLMUserDelete.new.test_1006f_linemanger_permisssions_update_delete
