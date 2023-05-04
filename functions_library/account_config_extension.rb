require File.expand_path('../base.rb', __FILE__)

class AccountConfigExtension < Base
#Navigation
  def navigate_to_company_details
    driver.find_element(css: 'href="/account"').click
  end

  def navigate_back_to_settings_breadcrumb
    driver.find_element(css: 'href="/account/settings"').click
  end

  def navigate_to_modules_chargable
    driver.find_element(css: 'href="/account/modules"').click
  end

  def navigate_to_picklist
  driver find_element(css: 'href="/account/picklists"').click
  end

#Account Details data
  def company_details_data_entry_edit
    driver.find_element(class: 'href="/account/edit"').click
    #company address
    driver.find_element(id: 'account_name').sendkeys "Regression Account Ltd"
    driver.find_element(id: 'account_address1').sendkeys "Testing House"
    driver.find_element(id: 'account_address2').sendkeys "Testing Lane"
    driver.find_element(id: 'account_address3').sendkeys "Testing Town"
    driver.find_element(id: 'account_city').sendkeys "London"
    driver.find_element(id: 'account_county').sendkeys "Greater London"
    driver.find_element(id: 'account_postcode').sendkeys "EC1N 3RD"
    driver.find_element(id: 'account_country_id').sendkeys "273"
    #company contact
    driver.find_element(id: 'account_contact_name').sendkeys "Administrator User"
    driver.find_element(id: 'account_contact_number').sendkeys "0207 654 2580"
    #driver.find_element(id: account_contact_email').sendkeys "info@regressionaccount.com"
    #additional company info
    driver.find_element(id: 'account_area').select_by("South East")
    driver.find_element(id: 'account_industry').select_by("Finance and insurance")
    #charity settings - non std
    driver.find_element(id: 'account_charity_name').sendkeys "Regression Account Ltd"
    driver.find_element(id: 'account_subscription_attributes_charity_number').sendkeys "4354129"
    driver.find_element(id: 'account_subscription_attributes_registered_charity_name').sendkeys "Regression Account Ltd"
    driver.find_element(id: 'account_subscription_attributes_charity_sort_code').sendkeys ""
    driver.find_element(id: 'account_subscription_attributes_charity_bank_account_number').sendkeys ""
    #domain
    driver.find_element(id: 'account_domain').sendkeys "regressionaccountdomain"
    driver.find_element(id: 'account-name-change-disclaimer').click
    #company logo
    driver.find_element(id: 'account_logo').sendkeys "" #need to find an image to upload and reference it here to the file
    #company payrite reference
    #driver.find_element(id: 'account_payrite_ref').sendkeys "159654"
    #remuneration currency
    driver.find_element(id: 'account_remuneration_currency_id').select_by(17)
    #hr partner code - non std
    #driver.find_element(id: 'account_partner_company_reference').sendkeys "215"
    #referral code - non std
    #driver.find_element(id: 'account_referred_by_code').sendkeys "" #need to find some data from a referral code withing staging
    #submit info
    driver.find_element(css: 'data-disable-with="update account"').click
    #cancel form
    #driver.find_element(class: 'btn btn-outline-secondary').click
  end

#Account Modules 
   def modules_chargable_switch_on
    #Expenses
    driver.find_element(id: 'account_use_expenses_1').click
    #Recruitment - std
    driver.find_element(id: 'account_recruitment_standard').click
    #Learn
    driver.find_element(id: 'account_use_learn_1').click
    #Rota, Time & Attendance
    driver.find_element(id: 'account_use_rta_1').click
    driver.find_element(id: 'update-chargeable-modules-btn').click
  end

  def navigate_to_modules_free
    driver.find_element(xpath: '//*[@id="tabs-0"]/li[2]/a').click
  end
  
  def modules_free_switch_on
    driver.find_element(id: 'account_use_company_suggestions').click
    driver.find_element(id: 'account_use_dbs').click
    driver.find_element(id: 'account_use_contacts').click
    driver.find_element(id: 'account_use_assets').click
    driver.find_element(id: 'account_use_grievances').click
    driver.find_element(id: 'account_use_id_documents').click
    driver.find_element(id: 'account_use_kudos').click
    driver.find_element(id: 'account_use_location_records').click
    driver.find_element(id: 'account_use_medical_facts').click
    driver.find_element(id: 'account_use_notes').click
    driver.find_element(id: 'account_use_org_chart').click
    driver.find_element(id: 'account_use_payslip_imports').click
    #payslip import - learn more
    driver.find_element(css: 'href="https://intercom.help/breathehr/articles/1899570-payslip-uploader"').click
    driver.find_element(id: 'account_use_personal_history').click
    driver.find_element(id: 'account_use_time_logs').click
    driver.find_element(id: 'account_use_training').click
    #submit in order to activate location booking
    driver.find_element(css: 'data-disable-with="update modules"').click
    driver.find_element(id: 'account_location_booking_enabled').click
    driver.find_element(css: 'data-disable-with="update modules"').click
  end
    
  def custom_fields
    driver.find_element(id: 'account_use_custom_fields').click
    driver.find_element(id: 'account_custom_field_1_label').sendkeys "Computer Equipment"
    driver.find_element(css: 'data-disable-with="update modules"').click
  end 
  
  def payroll_export_log_changes_only
    driver.find_element(id: 'account_use_payroll_export_changes').click
    driver.find_element(css: 'data-disable-with="update modules"').click
  end 

  def person_change_logs
    driver.find_element(id: 'account_log_employee_changes').click
    driver.find_element(css: 'data-disable-with="update modules"').click
  end 

  def onboarding_tasks_on
    driver.find_element(id: 'account_use_onboarding_1').click
    driver.find_element(css: 'data-disable-with="update modules"').click
  end 
  
  def xero_payroll_integration
    driver.find_element(id: 'account_use_xero_payroll_1').click
    driver.find_element(css: 'data-disable-with="update modules"').click
  end

#account Picklist configuration
#contract type 
  def details_contract_types_add
    driver.find_element(css: 'href="/company_contract_types"').click
    driver.find_element(css: 'href="/company_contract_types/new"').click
    driver.find_element(id: 'company_contract_type_name').sendkeys "Add Contract Type"
    driver.find_element(css: '#new_company_contract_type > p > input').click
  end

  def details_contract_types_add_cancel
    driver.find_element(css: 'href="/company_contract_types"').click
    driver.find_element(css: 'href="/company_contract_types/new"').click
    driver.find_element(id: 'company_contract_type_name').sendkeys "Add Contract Type"
    driver.find_element(xpath: '//*[@id="new_company_contract_type"]/p/a').click
  end

  def details_contract_type_add_return_breadcrumb
    driver.find_element(css: 'href="/company_contract_types"').click
    driver.find_element(css: 'href="/company_contract_types/new"').click
    driver.find_element(xpath: '/html/body/section/div/div/div/a').click
  end

  def details_contract_types_edit
    driver.find_element(css: 'href="/company_contract_types"').click
    driver.find_element(css: '//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[2]/a[1]/svg').click
    driver.find_element(id: 'company_contract_type_name').sendkeys "Contract Type Edit"
    driver.find_element(css: '#new_company_contract_type > p > input').click
  end
  
  def details_contract_types_edit_cancel
    driver.find_element(css: 'href="/company_contract_types"').click
    driver.find_element(css: '//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[2]/a[1]/svg').click
    driver.find_element(id: 'company_contract_type_name').sendkeys "Contract Type Edit"
    driver.find_element(css: '#new_company_contract_type > p > input').click
  end
  
  def details_contract_types_delete
    driver.find_element(css: 'href="/company_contract_types"').click
    driver.find_element(css: 'href="/company_contract_types/new"').click
    driver.find_element(css: '//*[@id="DataTables_Table_0"]/tbody/tr[4]/td[2]/svg').click
    driver.find_element(class: 'btn btn-danger modal-confirm').click
  end

  def details_contract_types_delete_cancel
    driver.find_element(css: 'href="/company_contract_types"').click
    driver.find_element(css: 'href="/company_contract_types/new"').click
    driver.find_element(css: '//*[@id="DataTables_Table_0"]/tbody/tr[4]/td[2]/svg').click
    driver.find_element(class: 'btn btn-danger modal-confirm').click
  end

#equipment type
  def details_equipment_types_add
    driver.find_element(css: 'href="/company_asset_types"').click
    driver.find_element(xpath: '/html/body/section[2]/div[2]/a/span/svg[2]').click
    driver.find_element(id: 'company_asset_type_name').sendkeys "Equipment test add"
    driver.find_element(id: 'company_asset_type_current').click
  end 

  def details_equipment_types_edit
    driver.find_element(css: 'href="/company_asset_types"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[3]/a[1]').click
    driver.find_element(id: 'company_asset_type_name').sendkeys "Equipment test Edit"
    driver.find_element(id: 'company_asset_type_current').click
  end 

  def details_equipment_types_delete
    driver.find_element(css: 'href="/company_asset_types"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[2]/td[3]/svg').click
    driver.find_element(xpath: '//*[@id="delete_company_asset_type_11"]/div/div/div[3]/button[2]').click
  end 

  def details_equipment_types_return_breadscrumb
    driver.find_element(css: 'href="/company_asset_types"').click
    driver.find_element(css: 'href="/account/picklists"').click
  end 

#ethnicities
  def details_ethnicities_add
    driver.find_element(css: 'href="/company_ethnicities"').click
    driver.find_element(xpath: '/html/body/section[2]/div[2]/a/span').click
    driver.find_element(id: 'company_ethnicity_name').sendkeys "Test Ethnicity Add"
    driver.find_element(xpath: '//*[@id="new_company_ethnicity"]/p/input').click
  end

  def details_ethnicities_edit
    driver.find_element(css: 'href="/company_ethnicities"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[2]/a[1]').click
    driver.find_element(xpath: '//*[@id="delete_ethnicity_39775"]/div/div/div[3]/button[2]').click
  end

  def details_ethnicities_delete
    driver.find_element(css: 'href="/company_ethnicities"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[6]/td[2]/svg').click
    driver.find_element(id: 'company_ethnicity_name').sendkeys "Test Ethnicity Add"
    driver.find_element(xpath: '//*[@id="new_company_ethnicity"]/p/input').click
  end

  def details_ethnicities_search
    driver.find_element(css: 'href="/company_ethnicities"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Chinese"
  end

  def details_genders_add
    driver.find_element(css: 'href="/genders"').click
    driver.find_element(css: 'href="/genders/new"').click
    driver.find_element(id: 'gender_name').sendkeys "Other"
    driver.find_element(css: '#edit_gender_5833 > p > input').click
  end

#gender
  def details_genders_edit
    driver.find_element(css: 'href="/genders"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr.odd > td.actions > a').click
    driver.find_element(id: 'gender_name').sendkeys "Other"
    driver.find_element(css: '#edit_gender_5833 > p > input').click
  end

  def details_genders_return_breadcrumb
    driver.find_element(css: 'href="/genders"').click
    driver.find_element(css: 'href="/account/picklists"').click  
  end
  
#id documents
  def details_id_documents_types_add
    driver.find_element(css: 'href="/company_identification_types"').click
    driver.find_element(xpath: '/html/body/section[2]/div[2]/a/span/svg[1]').click
    driver.find_element(id: 'company_identification_type_name').sendkeys "Regression test Add TODAY DATE"
    driver.find_element(xpath: '//*[@id="new_company_identification_type"]/p/input').click
  end

  def details_id_documents_types_edit
    driver.find_element(css: 'href="/company_identification_types"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[2]').click
    driver.find_element(id: 'company_identification_type_name').sendkeys "Regression test Edit TODAY DATE"
    driver.find_element(xpath: '//*[@id="new_company_identification_type"]/p/input').click
  end

  def details_id_documents_types_delete
    driver.find_element(css: 'href="/company_identification_types"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[6]/td[2]').click
    driver.find_element(id: 'company_identification_type_name').sendkeys "Regression test TODAY DATE"
    driver.find_element(xpath: '//*[@id="new_company_identification_type"]/p/input').click
  end

  def details_id_documents_types_search
    driver.find_element(css: 'href="/company_identification_types"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Regression test TODAY DATE"
    driver.find_element(xpath: '//*[@id="new_company_identification_type"]/p/input').click
  end

  def details_id_documents_types_breadcrumb
    driver.find_element(css: 'href="/company_identification_types"').click
    driver.find_element(xpath: '/html/body/section[2]/div[2]/a/span/svg[1]').click
    driver.find_element(css: 'href="/company_identification_types"').click
  end

#kudos types
  def details_kudos_types_add
    driver.find_element(css: 'href="/company_kudos_types"').click
    driver.find_element(css:'href="/company_kudos_types/new"').click
    driver.find_element(id:'company_kudos_type_name').sendkeys "Regression test add TODAY DATE"
    driver.find_element(xpath:'//*[@id="new_company_kudos_type"]/p/input').click
  end

  def details_kudos_types_edit
    driver.find_element(css: 'href="/company_kudos_types"').click
    driver.find_element(:'//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[3]/a[1]').click
    driver.find_element(id:'company_kudos_type_name').sendkeys "Regression test edit TODAY DATE"
    driver.find_element(xpath:'//*[@id="new_company_kudos_type"]/p/input').click
  end

  def details_kudos_types_delete
    driver.find_element(css: 'href="/company_kudos_types"').click
    driver.find_element(xpath:'//*[@id="DataTables_Table_0"]/tbody/tr[3]/td[3]/svg').click
    driver.find_element(xpath:'//*[@id="delete_company_kudos_type_14155"]/div/div/div[3]/button[2]').click
  end

  def details_kudos_types_search
    driver.find_element(css: 'href="/company_kudos_types"').click
    driver.find_element(:'//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Awesome service"
  end

  def details_kudos_types_breadcrumb
    driver.find_element(css: 'href="/company_kudos_types"').click
    driver.find_element(css:'href="/company_kudos_types/new"').click
    driver.find_element(css: 'href="/company_kudos_types"').click
  end

#notice period
  def details_notice_periods_add
    driver.find_element(css: 'href="/company_noticeperiods"').click
    driver.find_element(css:'href="/company_noticeperiods/new"').click
    driver.find_element(id:'company_noticeperiod_name').sendkeys "Regression Add TODAY DATE"
    driver.find_element(xpath:'//*[@id="new_company_noticeperiod"]/p/input').click
  end

  def details_notice_periods_edit
    driver.find_element(css: 'href="/company_noticeperiods"').click
    driver.find_element(css:'href="/company_noticeperiods/28331/edit"').click
    driver.find_element(id:'company_noticeperiod_name').sendkeys "Regression Edit TODAY DATE"
    driver.find_element(xpath:'//*[@id="new_company_noticeperiod"]/p/input').click
  end

  def details_notice_periods_delete
    driver.find_element(css: 'href="/company_noticeperiods"').click
    driver.find_element(xpath:'//*[@id="DataTables_Table_0"]/tbody/tr[2]/td[2]/svg').click
    driver.find_element(:'').
  end

  def details_notice_periods_search
    driver.find_element(css: 'href="/company_noticeperiods"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "1"
    sleep 1
  end

  def details_notice_periods_breadcrumb
    driver.find_element(css: 'href="/company_noticeperiods"').click
    driver.find_element(css:'href="/company_noticeperiods/new"').click
    driver.find_element(xpath:'//*[@id="delete_noticeperiod_28337"]/div/div/div[3]/button[2]').click
  end

#pronouns
  def details_pronouns_add
    driver.find_element(css: 'href="/company_pronouns"').click
    driver.find_element(css: 'href="/company_pronouns/new"').click
    driver.find_element(id: 'company_pronoun_name').sendkeys "Regression Add TODAY DATE"
    driver.find_element(xpath: '//*[@id="new_company_pronoun"]/p/input').click
  end

  def details_pronouns_cancel_add
    driver.find_element(css: 'href="/company_pronouns"').click
    driver.find_element(css: 'href="/company_pronouns/new"').click
    driver.find_element(css: 'href="/company_pronouns"').click
  end

  def details_pronouns_edit
    driver.find_element(css: 'href="/company_pronouns"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[2]').click
    driver.find_element(id: 'company_pronoun_name').sendkeys "Regression Add TODAY DATE"
    driver.find_element(xpath: '//*[@id="new_company_pronoun"]/p/input').click
  end

  def details_pronouns_delete
    driver.find_element(css: 'href="/company_pronouns"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[2]/td[2]/svg').click
    driver.find_element(: '').
  end

  def details_pronouns_search
    driver.find_element(css: 'href="/company_pronouns"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Him"
    sleep 1
  end

  def details_pronouns_breadcrumb
    driver.find_element(css: 'href="/company_pronouns"').click
    driver.find_element(css: 'href="/company_pronouns/new"').click
    driver.find_element(css: 'href="/company_pronouns"').click
  end

#reason for leaving
  def details_reason_for_leaving_add
    driver.find_element(css: 'href="/company_reason_for_leaving_types"').click
    driver.find_element(css: 'href="/company_reason_for_leaving_types/new"').click
    driver.find_element(id: 'id="company_reason_for_leaving_type_name"').sendkeys "Regression Add TODAY DATE"
    driver.find_element(xpath: '//*[@id="new_company_reason_for_leaving_type"]/p/input').click
  end

  def details_reason_for_leaving_edit
    driver.find_element(css: 'href="/company_reason_for_leaving_types"').click
    driver.find_element(css: '//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[3]').click
    driver.find_element(id: 'id="company_reason_for_leaving_type_name"').sendkeys "Regression Edit TODAY DATE"
    driver.find_element(xpath: '//*[@id="new_company_reason_for_leaving_type"]/p/input').click
  end

    def details_reason_for_leaving_delete
    driver.find_element(css: 'href="/company_reason_for_leaving_types"').click
    driver.find_element(css: '//*[@id="DataTables_Table_0"]/tbody/tr[2]/td[3]/svg').click
    driver.find_element(xpath: '//*[@id="delete_reason_for_leaving_type_53318"]/div/div/div[3]/button[2]').click
  end

  def details_reason_for_leaving_search
    driver.find_element(css: 'href="/company_reason_for_leaving_types"').click
    driver.find_element(css: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys ""
    sleep 1
  end

    def details_reason_for_leaving_breadcrumb
    driver.find_element(css: 'href="/company_reason_for_leaving_types"').click
    driver.find_element(css: 'href="/company_reason_for_leaving_types/new"').click
    driver.find_element(css: 'href="/company_reason_for_leaving_types"').click
  end

#onboarding tasks
  def details_onboarding_tasks
    driver.find_element(css: 'href="/company_tasks"').click
  end

#other leave types
  def absence_other_leave_reasons
    driver.find_element(css: 'href="/company_leave_reasons"').click
  end

#sickness types
  def absence_sickness_types
    driver.find_element(css: 'href="/company_sicknesstypes"').click
  end

#training categories
  def training_categories
    driver.find_element(css: 'href="/company_training_categories"').click
  end 

#training provider
  def training_providers
    driver.find_element(css: 'href="/company_training_providers"').click
  end 

#training types
  def training_types
    driver.find_element(css: 'href="/company_training_types"').click
  end 

#departments
  def company_organisation_department
    driver.find_element(css: 'href="/company_departments"').click  
  end

#divisions
  def company_organisation_division
    driver.find_element(css: 'href="/company_divisions"').click
  end

#additional payment types
  def pay_and_benefits_additional_payment_types
    driver.find_element(css: 'href="/company_additional_payment_types"').click
  end

#benefit types
  def pay_and_benefits_benefit_types
    driver.find_element(css: 'href="/company_benefit_types"').click
  end
 
#disciplinary outcomes
  def performance_management_disciplinary_outcomes
    driver.find_element(css: 'href="/company_disciplinary_outcomes"').click
  end
  
#grievence outcomes
  def performance_management_grievance_outcomes
    driver.find_element(css: 'href="/company_grievance_outcomes"').click
  end
  
#one to ones
  def performance_management_one_to_one_types
    driver.find_element(css: 'href="/company_one_to_one_types"').click
  end
  

end
