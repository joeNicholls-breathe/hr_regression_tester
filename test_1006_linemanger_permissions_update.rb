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
class AccountSetupLMUser < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_line_manger_permisssions_setup
    NavigateBrowserExtension.new(driver).breathe_login
    puts '1. navigate to breathe login url'
    LoginExtension.new(driver).login_setup_acc_admin
    LoginAppExtension.new(driver).select_hr
    puts '2. login'
    puts "add Line manager to account"
    puts "assign Line manager permissions to employee"
    puts "navigate to line settings - assign account settings to HR user"
    # view
    AccountConfigExtension.new(driver).navigate_to_change_what_line_managers_can_do
    AccountConfigExtension.new(driver).line_manager_configuration_on_personal_profile_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_leave_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_adjustments_and_toil_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_sickness_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_training_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_one_to_ones_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_objectives_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_deliverables_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_job_details_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_remuneration_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_emergency_contacts_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_medical_facts_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_personal_history_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_notes_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_equipment_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_id_documents_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_dbs_checks_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_grievances_and_disciplinaries_view
    AccountConfigExtension.new(driver).line_manager_configuration_on_time_logs_view
    AccountConfigExtension.new(driver).line_manager_configurations_update
    # to return to settings if required - one to think about in the process when we run the script
    AccountConfigExtension.new(driver).navigate_back_to_settings_breadcrumb
    puts 'Permissions and approvals - Line manager can view all employee areas'
    # manage
    AccountConfigExtension.new(driver).navigate_to_change_what_line_managers_can_do
    AccountConfigExtension.new(driver).line_manager_configuration_on_profile_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_personal_profile_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_leave_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_adjustments_and_toil_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_sickness_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_training_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_one_to_ones_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_objectives_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_deliverables_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_job_details_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_remuneration_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_emergency_contacts_manage
    AccountConfigExtension.new(driver).ine_manager_configuration_on_medical_facts_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_personal_history_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_notes_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_equipment_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_id_documents_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_dbs_checks_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_grievances_and_disciplinaries_manage
    AccountConfigExtension.new(driver).line_manager_configuration_on_time_logs_manage
    AccountConfigExtension.new(driver).line_manager_configurations_update
    puts 'Permissions and approvals - Line manager can manage all employee areas'
    AccountConfigExtension.new(driver).navigate_back_to_settings_breadcrumb
    # delete
    AccountConfigExtension.new(driver).navigate_to_change_what_line_managers_can_do
    AccountConfigExtension.new(driver).line_manager_configuration_on_profile_delete_docs_only
    AccountConfigExtension.new(driver).line_manager_configuration_on_leave_delete
    AccountConfigExtension.new(driver).line_manager_configuration_on_sickness_delete
    AccountConfigExtension.new(driver).line_manager_configuration_on_training_delete
    AccountConfigExtension.new(driver).line_manager_configuration_on_one_to_ones_delete
    AccountConfigExtension.new(driver).line_manager_configuration_on_objectives_delete
    AccountConfigExtension.new(driver).line_manager_configuration_on_deliverables_delete
    AccountConfigExtension.new(driver).line_manager_configuration_on_job_details_delete
    AccountConfigExtension.new(driver).line_manager_configuration_on_remuneration_delete
    AccountConfigExtension.new(driver).line_manager_configuration_on_emergency_contacts_delete
    AccountConfigExtension.new(driver).line_manager_configuration_on_medical_facts_delete
    AccountConfigExtension.new(driver).line_manager_configuration_on_personal_history_delete
    AccountConfigExtension.new(driver).line_manager_configuration_on_notes_delete
    AccountConfigExtension.new(driver).line_manager_configuration_on_equipment_delete
    AccountConfigExtension.new(driver).line_manager_configuration_on_id_documents_delete
    AccountConfigExtension.new(driver).line_manager_configuration_on_dbs_checks_delete
    AccountConfigExtension.new(driver).line_manager_configuration_on_grievances_and_disciplinaries_delete
    AccountConfigExtension.new(driver).line_manager_configuration_on_time_logs_delete
    AccountConfigExtension.new(driver).line_manager_configurations_update
    puts 'Permissions and approvals - Line manager can delete all employee areas'
    AccountConfigExtension.new(driver).navigate_back_to_settings_breadcrumb
    # Add line manager view of peoples, people and bank details
    AccountConfigExtension.new(driver).navigate_to_change_what_line_managers_can_do
    AccountConfigExtension.new(driver).line_manager_able_to_see_their_peoples_people
    AccountConfigExtension.new(driver).line_manage_able_to_see_their_peoples_bank_details
    AccountConfigExtension.new(driver).line_manager_configurations_update
    puts 'Permissions and approvals - Line manager has all access to personal profile details'
    AccountConfigExtension.new(driver).navigate_to_change_what_employees_can_do
    AccountConfigExtension.new(driver).employee_congifuration_what_can_see_remunerations
    AccountConfigExtension.new(driver).employee_congifuration_what_can_see_performance_metrics
    AccountConfigExtension.new(driver).employee_congifuration_what_can_see_custom_fields
    AccountConfigExtension.new(driver).employee_congifuration_what_can_see_directory
    AccountConfigExtension.new(driver).employee_congifuration_what_can_see_calendar
    AccountConfigExtension.new(driver).employee_congifuration_what_can_see_kudus_leaderboard
    AccountConfigExtension.new(driver).employee_congifuration_what_can_see_location_booking_report
    AccountConfigExtension.new(driver).employee_congifuration_what_can_do_update_profile_picture
    AccountConfigExtension.new(driver).employee_congifuration_what_can_do_request_toil
    AccountConfigExtension.new(driver).employee_congifuration_what_can_do_report_sickness
    AccountConfigExtension.new(driver).employee_congifuration_what_can_do_request_one_to_ones
    AccountConfigExtension.new(driver).employee_congifuration_what_can_do_enter_traiining_record
    AccountConfigExtension.new(driver).employee_congifuration_what_can_do_booking_locations
    AccountConfigExtension.new(driver).employee_congifuration_update
    AccountConfigExtension.new(driver).navigate_back_to_settings_breadcrumb
    puts 'Permissions and approvals - Employee check what people can see and do'
    sleep 10
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
AccountSetupLMUser.new.test_line_manger_permisssions_setup
