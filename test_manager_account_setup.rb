require 'selenium-webdriver'
require './functions_library/test_page_check.rb'
require './functions_library/test_reference_extension.rb'
require './functions_library/login_extension.rb'
require './functions_library/login_app_extension.rb'
require './functions_library/navigate_browser_extension.rb'
require './functions_library/navigate_around_app_manager.rb'

class AccountSetup
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
    driver.manage.timeouts.implicit_wait = 5
  end

  def test_account_setup
    NavigateBrowserExtension.new(driver).breathe_login
    puts "navigate to breathe login url"
    LoginExtension.new(driver).login_setup_acc_admin
    sleep 1
    LoginAppExtension.new(driver).select_hr
    sleep 1
    puts "login"
    AppNavigationExtensionManager.new(driver).navigate_to_settings
    puts "navigate to configuration settings"
    AccountConfigExtension.new(driver).navigate_to_company_details
    AccountConfigExtension.new(driver).company_details_data_entry_edit
    AccountConfigExtension.new(driver).navigate_back_to_settings_breadcrumb
    puts "enter company details"
    AccountConfigExtension.new(driver).navigate_to_modules_chargable
    AccountConfigExtension.new(driver).modules_chargable_switch_on
    puts "switch on modules - chargable"
    AccountConfigExtension.navigate_to_modules_free
    AccountConfigExtension.modules_free_switch_on
    puts "switch on modules - free"
    AccountConfigExtension.custom_fields
    puts "add a custom field"
    AccountConfigExtension.payroll_export_log_changes_only
    puts "switch on payroll exports"
    AccountConfigExtension.person_change_logs
    puts "switch on change logs"
    AccountConfigExtension.onboarding_tasks_on
    puts "add onboarding tasks for employee"
    AccountConfigExtension.xero_payroll_integration
    puts "switch on xero integration *might want to do this as the buy now journey"
    AccountConfigExtension.navigate_to_picklist
    puts "navigate to picklists"
#details
    AccountConfigExtension.details_contract_types_add
    AccountConfigExtension.details_equipment_types_add
    AccountConfigExtension.details_ethnicities_add
    AccountConfigExtension.details_id_documents_types_add
    AccountConfigExtension.details_kudos_types_add
    AccountConfigExtension.details_notice_periods_add
    AccountConfigExtension.details_pronouns_add
    AccountConfigExtension.details_reason_for_leaving_add
    AccountConfigExtension.details_onboarding_tasks_add
#absence
    AccountConfigExtension.absence_other_leave_reasons_add
    AccountConfigExtension.absence_sickness_types_new
#training
    AccountConfigExtension.training_categories_new
    AccountConfigExtension.training_providers_new
    AccountConfigExtension.training_types_new
#company organisation
    AccountConfigExtension.company_organisation_department_new
    AccountConfigExtension.company_organisation_division_new
#pay and benefits
    AccountConfigExtension.pay_and_benefits_additional_payment_types_new
    AccountConfigExtension.pay_and_benefits_benefit_types_new
    AccountConfigExtension.pay_and_benefits_expense_types_new
    AccountConfigExtension.pay_and_benefits_mileage_rates_new
#recruitment
    AccountConfigExtension.recruitment_applicant_stages_new
    AccountConfigExtension.recruitment_applicant_source_new
#performance 
    AccountConfigExtension.performance_management_disciplinary_outcomes_new
    AccountConfigExtension.performance_management_grievance_outcomes_new
    AccountConfigExtension.performance_management_one_to_one_types_new
    puts "Picklist details add"
    AccountConfigExtension.details_contract_types_edit
    AccountConfigExtension.details_equipment_types_edit
    AccountConfigExtension.details_ethnicities_edit
    AccountConfigExtension.details_genders_edit
    AccountConfigExtension.details_id_documents_types_edit
    AccountConfigExtension.details_kudos_types_edit
    AccountConfigExtension.details_notice_periods_edit
    AccountConfigExtension.details_pronouns_edit
    AccountConfigExtension.details_reason_for_leaving_edit
    AccountConfigExtension.details_onboarding_tasks_edit
#absence
    AccountConfigExtension.absence_other_leave_reasons_edit
    AccountConfigExtension.absence_sickness_types_edit
#training
    AccountConfigExtension.training_categories_edit
    AccountConfigExtension.training_providers_edit
    AccountConfigExtension.training_types_edit
#company organisation
    AccountConfigExtension.company_organisation_department_edit
    AccountConfigExtension.company_organisation_division_edit
#pay and benefits
    AccountConfigExtension.pay_and_benefits_additional_payment_types_edit
    AccountConfigExtension.pay_and_benefits_benefit_types_edit
    AccountConfigExtension.pay_and_benefits_expense_types_edit
    AccountConfigExtension.pay_and_benefits_mileage_rates_edit
#recruitment
    AccountConfigExtension.recruitment_applicant_stages_edit
    AccountConfigExtension.recruitment_applicant_source_edit
#performance 
    AccountConfigExtension.performance_management_disciplinary_outcomes_edit
    AccountConfigExtension.performance_management_grievance_outcomes_edit
    AccountConfigExtension.performance_management_one_to_one_types_edit
    puts "Picklist details edit"
    AccountConfigExtension.details_contract_types_search
    AccountConfigExtension.details_equipment_types_search
    AccountConfigExtension.details_ethnicities_search
    AccountConfigExtension.details_genders_search
    AccountConfigExtension.details_id_documents_types_search
    AccountConfigExtension.details_kudos_types_search
    AccountConfigExtension.details_notice_periods_search
    AccountConfigExtension.details_pronouns_search
    AccountConfigExtension.details_reason_for_leaving_search
    AccountConfigExtension.details_onboarding_tasks_search
#absence
    AccountConfigExtension.absence_other_leave_reasons_search
    AccountConfigExtension.absence_sickness_types_search
#training
    AccountConfigExtension.training_categories_search
    AccountConfigExtension.training_providers_search
    AccountConfigExtension.training_types_search
#company organisation
    AccountConfigExtension.company_organisation_department_search
    AccountConfigExtension.company_organisation_division_search
#pay and benefits
    AccountConfigExtension.pay_and_benefits_additional_payment_types_search
    AccountConfigExtension.pay_and_benefits_benefit_types_search
    AccountConfigExtension.pay_and_benefits_expense_types_search
    AccountConfigExtension.pay_and_benefits_mileage_rates_search
#recruitment
    AccountConfigExtension.recruitment_applicant_stages_search
    AccountConfigExtension.recruitment_applicant_source_search
#performance 
    AccountConfigExtension.performance_management_disciplinary_outcomes_search
    AccountConfigExtension.performance_management_grievance_outcomes_search
    AccountConfigExtension.performance_management_one_to_one_types_search
    Puts "Picklist details search"
    AccountConfigExtension.details_contract_types_delete
    AccountConfigExtension.details_equipment_types_delete
    AccountConfigExtension.details_ethnicities_delete
    AccountConfigExtension.details_genders_delete
    AccountConfigExtension.details_id_documents_types_delete
    AccountConfigExtension.details_kudos_types_delete
    AccountConfigExtension.details_notice_periods_delete
    AccountConfigExtension.details_pronouns_delete
    AccountConfigExtension.details_reason_for_leaving_delete
    AccountConfigExtension.details_onboarding_tasks_delete
#absence
    AccountConfigExtension.absence_other_leave_reasons_delete
    AccountConfigExtension.absence_sickness_types_delete
#training
    AccountConfigExtension.training_categories_delete
    AccountConfigExtension.training_providers_delete
    AccountConfigExtension.training_types_delete
#company organisation
    AccountConfigExtension.company_organisation_department_delete
    AccountConfigExtension.company_organisation_division_delete
#pay and benefits
    AccountConfigExtension.pay_and_benefits_additional_payment_types_delete
    AccountConfigExtension.pay_and_benefits_benefit_types_delete
    AccountConfigExtension.pay_and_benefits_expense_types_delete
    AccountConfigExtension.pay_and_benefits_mileage_rates_delete
#recruitment
    AccountConfigExtension.recruitment_applicant_stages_delete
    AccountConfigExtension.recruitment_applicant_source_delete
#performance 
    AccountConfigExtension.performance_management_disciplinary_outcomes_delete
    AccountConfigExtension.performance_management_grievance_outcomes_delete
    AccountConfigExtension.performance_management_one_to_one_types_delete
    Puts "Picklist details delete"
    AccountConfigExtension.details_contract_types_breadcrumb
    AccountConfigExtension.details_equipment_types_breadcrumb
    AccountConfigExtension.details_ethnicities_breadcrumb
    AccountConfigExtension.details_genders_breadcrumb
    AccountConfigExtension.details_id_documents_types_breadcrumb
    AccountConfigExtension.details_kudos_types_breadcrumb
    AccountConfigExtension.details_notice_periods_breadcrumb
    AccountConfigExtension.details_pronouns_breadcrumb
    AccountConfigExtension.details_reason_for_leaving_breadcrumb
    AccountConfigExtension.details_onboarding_tasks_breadcrumb
#absence
    AccountConfigExtension.absence_other_leave_reasons_breadcrumb
    AccountConfigExtension.absence_sickness_types_breadcrumb
#training
    AccountConfigExtension.training_categories_breadcrumb
    AccountConfigExtension.training_providers_breadcrumb
    AccountConfigExtension.training_types_breadcrumb
#company organisation
    AccountConfigExtension.company_organisation_department_breadcrumb
    AccountConfigExtension.company_organisation_division_breadcrumb
#pay and benefits
    AccountConfigExtension.pay_and_benefits_additional_payment_types_breadcrumb
    AccountConfigExtension.pay_and_benefits_benefit_types_breadcrumb
    AccountConfigExtension.pay_and_benefits_expense_types_breadcrumb
    AccountConfigExtension.pay_and_benefits_mileage_rates_breadcrumb
#recruitment
    AccountConfigExtension.recruitment_applicant_stages_breadcrumb
    AccountConfigExtension.recruitment_applicant_source_breadcrumb
#performance 
    AccountConfigExtension.performance_management_disciplinary_outcomes_breadcrumb
    AccountConfigExtension.performance_management_grievance_outcomes_breadcrumb
    AccountConfigExtension.performance_management_one_to_one_types_breadcrumb
    Puts "Picklist details breadcrumb"
    AccountConfigExtension.details_contract_types_cancel_new
    AccountConfigExtension.details_equipment_types_cancel_new
    AccountConfigExtension.details_ethnicities_cancel_new
    AccountConfigExtension.details_genders_cancel_new
    AccountConfigExtension.details_id_documents_types_cancel_new
    AccountConfigExtension.details_kudos_types_cancel_new
    AccountConfigExtension.details_notice_periods_cancel_new
    AccountConfigExtension.details_pronouns_cancel_new
    AccountConfigExtension.details_reason_for_leaving_cancel_new
    AccountConfigExtension.details_onboarding_tasks_cancel_new
#absence
    AccountConfigExtension.absence_other_leave_reasons_cancel_new
    AccountConfigExtension.absence_sickness_types_cancel_new
#training
    AccountConfigExtension.training_categories_cancel_new
    AccountConfigExtension.training_providers_cancel_new
    AccountConfigExtension.training_types_cancel_new
#company organisation
    AccountConfigExtension.company_organisation_department_cancel_new
    AccountConfigExtension.company_organisation_division_cancel_new
#pay and benefits
    AccountConfigExtension.pay_and_benefits_additional_payment_types_cancel_new
    AccountConfigExtension.pay_and_benefits_benefit_types_cancel_new
    AccountConfigExtension.pay_and_benefits_expense_types_cancel_new
    AccountConfigExtension.pay_and_benefits_mileage_rates_cancel_new
#recruitment
    AccountConfigExtension.recruitment_applicant_stages_cancel_new
    AccountConfigExtension.recruitment_applicant_source_cancel_new
#performance 
    AccountConfigExtension.performance_management_disciplinary_outcomes_cancel_new
    AccountConfigExtension.performance_management_grievance_outcomes_cancel_new
    AccountConfigExtension.performance_management_one_to_one_types_cancel_new
    puts "Picklist Cancel New"
    AccountConfigExtension.navigate_to_email_notifications
    AccountConfigExtension.system_notifications_on
    puts "Email notification On"
    AccountConfigExtension.navigate_to_email_notifications
    AccountConfigExtension.system_notifications_off
    puts "Email notification Off"
    AccountConfigExtension.navigate_to_email_notifications
    AccountConfigExtension.third_party_email_invoice
    puts "Email notification thid party invoice email"
    AccountConfigExtension.navigate_to_email_notifications
    AccountConfigExtension.third_party_email_leave_request_approval
    puts "Email notification thid party leave requests email"
    AccountConfigExtension.navigate_to_email_notifications
    AccountConfigExtension.third_party_email_approved_expenses
    puts "Email notification thid party expenses email"
    AccountConfigExtension.navigate_to_two_factor_authentication
    AccountConfigExtension.twofa_everyone_on
    AccountConfigExtension.navigate_back_to_settings_breadcrumb
    puts "security 2fa everyone"
    AccountConfigExtension.navigate_to_change_what_hr_users_can_do
    AccountConfigExtension.hr_user_configuration_leave_needs_approval_on
    AccountConfigExtension.hr_user_configuration_use_gravatar_on
    AccountConfigExtension.hr_user_configuration_disable_welcome_page_on
    AccountConfigExtension.hr_user_configuration_use_bradford_factor_on
    AccountConfigExtension.hr_user_configuration_remind_line_manager_to_give_121_on
    AccountConfigExtension.hr_user_configuration_grapevine_label
    AccountConfigExtension.update_hr_settings
    AccountConfigExtension.navigate_back_to_settings_breadcrumb
    puts "Permissions and approvals - check what people can do - HR user"
#view
    AccountConfigExtension.navigate_to_change_what_line_managers_can_do
    AccountConfigExtension.line_manager_configuration_on_personal_profile_view
    AccountConfigExtension.line_manager_configuration_on_leave_view
    AccountConfigExtension.line_manager_configuration_on_adjustments_and_toil_view
    AccountConfigExtension.line_manager_configuration_on_sickness_view
    AccountConfigExtension.line_manager_configuration_on_training_view
    AccountConfigExtension.line_manager_configuration_on_one_to_ones_view
    AccountConfigExtension.line_manager_configuration_on_objectives_view
    AccountConfigExtension.line_manager_configuration_on_deliverables_view
    AccountConfigExtension.line_manager_configuration_on_job_details_view
    AccountConfigExtension.line_manager_configuration_on_remuneration_view
    AccountConfigExtension.line_manager_configuration_on_emergency_contacts_view
    AccountConfigExtension.line_manager_configuration_on_medical_facts_view
    AccountConfigExtension.line_manager_configuration_on_personal_history_view
    AccountConfigExtension.line_manager_configuration_on_notes_view
    AccountConfigExtension.line_manager_configuration_on_equipment_view
    AccountConfigExtension.line_manager_configuration_on_id_documents_view
    AccountConfigExtension.line_manager_configuration_on_dbs_checks_view
    AccountConfigExtension.line_manager_configuration_on_grievances_and_disciplinaries_view
    AccountConfigExtension.line_manager_configuration_on_time_logs_view
    AccountConfigExtension.line_manager_configurations_update
    # to return to settings if required - one to think about in the process when we run the script
    AccountConfigExtension.navigate_back_to_settings_breadcrumb
    puts "Permissions and approvals - Line manager can view all employee areas"
#manage
    AccountConfigExtension.navigate_to_change_what_line_managers_can_do
    AccountConfigExtension.line_manager_configuration_on_profile_manage
    AccountConfigExtension.line_manager_configuration_on_personal_profile_manage
    AccountConfigExtension.line_manager_configuration_on_leave_manage
    AccountConfigExtension.line_manager_configuration_on_adjustments_and_toil_manage
    AccountConfigExtension.line_manager_configuration_on_sickness_manage
    AccountConfigExtension.line_manager_configuration_on_training_manage
    AccountConfigExtension.line_manager_configuration_on_one_to_ones_manage
    AccountConfigExtension.line_manager_configuration_on_objectives_manage
    AccountConfigExtension.line_manager_configuration_on_deliverables_manage
    AccountConfigExtension.line_manager_configuration_on_job_details_manage
    AccountConfigExtension.line_manager_configuration_on_remuneration_manage
    AccountConfigExtension.line_manager_configuration_on_emergency_contacts_manage
    AccountConfigExtension.line_manager_configuration_on_medical_facts_manage
    AccountConfigExtension.line_manager_configuration_on_personal_history_manage
    AccountConfigExtension.line_manager_configuration_on_notes_manage
    AccountConfigExtension.line_manager_configuration_on_equipment_manage
    AccountConfigExtension.line_manager_configuration_on_id_documents_manage
    AccountConfigExtension.line_manager_configuration_on_dbs_checks_manage
    AccountConfigExtension.line_manager_configuration_on_grievances_and_disciplinaries_manage
    AccountConfigExtension.line_manager_configuration_on_time_logs_manage
    AccountConfigExtension.line_manager_configurations_update
    puts "Permissions and approvals - Line manager can manage all employee areas"
    AccountConfigExtension.navigate_back_to_settings_breadcrumb
#delete
    AccountConfigExtension.navigate_to_change_what_line_managers_can_do
    AccountConfigExtension.line_manager_configuration_on_profile_delete_docs_only
    AccountConfigExtension.line_manager_configuration_on_leave_delete
    AccountConfigExtension.line_manager_configuration_on_sickness_delete
    AccountConfigExtension.line_manager_configuration_on_training_delete
    AccountConfigExtension.line_manager_configuration_on_one_to_ones_delete
    AccountConfigExtension.line_manager_configuration_on_objectives_delete
    AccountConfigExtension.line_manager_configuration_on_deliverables_delete
    AccountConfigExtension.line_manager_configuration_on_job_details_delete
    AccountConfigExtension.line_manager_configuration_on_remuneration_delete
    AccountConfigExtension.line_manager_configuration_on_emergency_contacts_delete
    AccountConfigExtension.line_manager_configuration_on_medical_facts_delete
    AccountConfigExtension.line_manager_configuration_on_personal_history_delete
    AccountConfigExtension.line_manager_configuration_on_notes_delete
    AccountConfigExtension.line_manager_configuration_on_equipment_delete
    AccountConfigExtension.line_manager_configuration_on_id_documents_delete
    AccountConfigExtension.line_manager_configuration_on_dbs_checks_delete
    AccountConfigExtension.line_manager_configuration_on_grievances_and_disciplinaries_delete
    AccountConfigExtension.line_manager_configuration_on_time_logs_delete
    AccountConfigExtension.line_manager_configurations_update
    puts "Permissions and approvals - Line manager can delete all employee areas"
    AccountConfigExtension.navigate_back_to_settings_breadcrumb
#Add line manager view of peoples, people and bank details
    AccountConfigExtension.navigate_to_change_what_line_managers_can_do
    AccountConfigExtension.line_manager_able_to_see_their_peoples_people
    AccountConfigExtension.line_manage_able_to_see_their_peoples_bank_details
    AccountConfigExtension.line_manager_configurations_update
    puts "Permissions and approvals - Line manager has all access to personal profile details"
    AccountConfigExtension.navigate_to_change_what_employees_can_do
    AccountConfigExtension.employee_congifuration_what_can_see_remunerations
    AccountConfigExtension.employee_congifuration_what_can_see_performance_metrics
    AccountConfigExtension.employee_congifuration_what_can_see_custom_fields
    AccountConfigExtension.employee_congifuration_what_can_see_directory
    AccountConfigExtension.employee_congifuration_what_can_see_calendar
    AccountConfigExtension.employee_congifuration_what_can_see_kudus_leaderboard
    AccountConfigExtension.employee_congifuration_what_can_see_location_booking_report
    AccountConfigExtension.employee_congifuration_what_can_do_update_profile_picture
    AccountConfigExtension.employee_congifuration_what_can_do_request_toil
    AccountConfigExtension.employee_congifuration_what_can_do_report_sickness
    AccountConfigExtension.employee_congifuration_what_can_do_request_one_to_ones
    AccountConfigExtension.employee_congifuration_what_can_do_enter_traiining_record
    AccountConfigExtension.employee_congifuration_what_can_do_booking_locations
    AccountConfigExtension.employee_congifuration_update
    AccountConfigExtension.navigate_back_to_settings_breadcrumb
    puts "Permissions and approvals - Employee check what people can see and do"
    
    AccountConfigExtension.navigate_to_woking_patterns
    puts "Abscence settings - working patterns (adding new and editing away from the default)"
    AccountConfigExtension.navigate_back_to_settings_breadcrumb

    AccountConfigExtension.navigate_to_holiday_allowances
    puts "Abscence settings - holidays allowances"
    AccountConfigExtension.navigate_back_to_settings_breadcrumb

    AccountConfigExtension.navigate_to_holiday_years
    puts "Abscence settings - holidays years"
    AccountConfigExtension.navigate_back_to_settings_breadcrumb

    AccountConfigExtension.navigate_to_company_holidays
    puts "Abscence settings - company holidays"
    AccountConfigExtension.navigate_back_to_settings_breadcrumb

    AccountConfigExtension.navigate_to_company_blackout
    puts "Abscence settings - company blackouts"
    AccountConfigExtension.navigate_back_to_settings_breadcrumb

    AccountConfigExtension.navigate_to_api_setup
    puts "Integrations - API setup"
    AccountConfigExtension.navigate_back_to_settings_breadcrumb

    AccountConfigExtension.navigate_to_calendar_subscriptions
    puts "Integrations - calendar subscriptions"
    AccountConfigExtension.navigate_back_to_settings_breadcrumb

    AccountConfigExtension.navigate_to_rota_cloud
    puts "Integrations - Rotacloud"
    AccountConfigExtension.navigate_back_to_settings_breadcrumb
    




    puts "add line manager to account"

    puts "add employee to account"

    puts "assign permissions to employees"

    puts "assign line managers to employees"
    sleep 10
    driver.close
  end
end

AccountSetup.new.test_account_setup