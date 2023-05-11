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
  end

  def test_account_setup
    LoginExtension.login_admin
    LoginAppExtension.select_hr
    puts "login"
    AppNavigationExtensionManager.navigate_to_settings
    puts "navigate to configuration settings"
    AccountConfigExtension.navigate_to_company_details
    AccountConfigExtension.company_details_data_entry_edit
    AccountConfigExtension.navigate_back_to_settings_breadcrumb
    puts "enter company details"
    AccountConfigExtension.navigate_to_modules_chargable
    AccountConfigExtension.modules_chargable_switch_on
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
    

    puts "Email notification set up add/edit/delete/search/breadcrumb"

    puts "Permissions and approvals of HR/Line Managers and employees add/edit/delete/search/breadcrumb" 

    puts "abscence settings - holidays and working patterns (adding new and editing away from the default)"

    puts "check what people can do - employee"

    puts "check what people can do - Line manager"

    puts "check what people can do - HR user"

    puts "security 2fa"

    puts "add line manager to account"

    puts "add employee to account"

    puts "assign permissions to employees"

    puts "assign line managers to employees"
  
    driver.close
  end
end

AccountSetup.new.test_account_setup