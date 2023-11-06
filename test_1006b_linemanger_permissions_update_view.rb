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
class AccountSetupLMUserView < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_line_manger_view_permisssions_setup
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
    # view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_personal_profile_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_leave_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_adjustments_and_toil_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_sickness_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_training_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_one_to_ones_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_objectives_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_deliverables_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_job_details_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_remuneration_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_emergency_contacts_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_medical_facts_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_personal_history_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_notes_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_equipment_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_id_documents_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_dbs_checks_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_grievances_and_disciplinaries_view
    LineManagerConfigExtension.new(driver).line_manager_configuration_on_time_logs_view
    LineManagerConfigExtension.new(driver).line_manager_configurations_update
    # to return to settings if required - one to think about in the process when we run the script
    LineManagerConfigExtension.new(driver).navigate_back_to_settings_breadcrumb
    puts 'Permissions and approvals - Line manager can view all employee areas'
    # Add line manager view of peoples, people and bank details
    LineManagerConfigExtension.new(driver).line_manager_able_to_see_their_peoples_people
    LineManagerConfigExtension.new(driver).line_manage_able_to_see_their_peoples_bank_details
    LineManagerConfigExtension.new(driver).line_manager_configurations_update
    puts 'Permissions and approvals - Line manager has all access to personal profile details'
    sleep 10
    puts 'Test 1006b complete'
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
AccountSetupLMUserView.new.test_line_manger_view_permisssions_setup
