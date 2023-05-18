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

  def navigate_to_email_notifications
    driver.find_element(css: 'href="/account/edit_email_configuration"').click
  end

  def navigate_to_two_factor_authentication
    driver.find_element(css: 'href="/account/edit_mfa_configuration"').click
  end

  def navigate_to_change_what_hr_users_can_do
    driver.find_element(css: 'href="/account/edit_staff_configuration"').click
  end

  def navigate_to_change_what_line_managers_can_do
    driver.find_element(css: 'href="/account/line_manager_permissions"').click
  end

  def navigate_to_change_what_employees_can_do
    driver.find_element(css: 'href="/account/edit_employee_configuration"').click
  end

  def navigate_to_woking_patterns
    driver.find_element(css: 'href="/account_working_patterns"').click
  end

  def navigate_to_holiday_allowances
    driver.find_element(css: 'href="/account_holiday_allowances"').click
  end

  def navigate_to_holiday_years
    driver.find_element(css: 'href="/account/holiday_years"').click
  end

  def navigate_to_company_holidays
    driver.find_element(css: 'href="/company_holidays"').click
  end

  def navigate_to_company_blackout
    driver.find_element(css: 'href="/company_blackouts"').click
  end

  def navigate_to_api_setup
    driver.find_element(css: 'href="/account/api_setup"').click
  end

  def navigate_to_calendar_subscriptions
    driver.find_element(css: 'href="/account/calendar_syncing"').click
  end

  def navigate_to_rota_cloud
    driver.find_element(css: 'href="/account/integrations"').click
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
  def details_onboarding_tasks_add
    driver.find_element(css: 'href="/company_tasks"').click
    driver.find_element(id: 'create-company-task-submit').click
    driver.find_element(id: 'company_task_title').sendkeys "New Task - Regression Test DATE TODAY"
    driver.find_element(id: 'company_task_description').sendkeys "Description test for Regression Suite TODAY DATE"
    driver.find_element(id: 'add-company-task-submit').click
  end

    def details_onboarding_tasks_edit
    driver.find_element(css: 'href="/company_tasks"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[2]/a/svg').click
    driver.find_element(id: 'company_task_title').sendkeys "Edit Task - Regression Test DATE TODAY"
    driver.find_element(id: 'company_task_description').sendkeys "Edit description test for Regression Suite TODAY DATE"
    driver.find_element(id: 'add-company-task-submit').click
  end

  def details_onboarding_tasks_delete
    driver.find_element(css: 'href="/company_tasks"').click
    driver.find_element(id: 'delete_task_142').click #need to make sure i pull the appropriate id out of the ui
    driver.find_element(css: '#delete_task_142 > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm').click
  end

  def details_onboarding_tasks_search #this will need to be reviewed
    driver.find_element(css: 'href="/company_tasks"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "New Task - Regression Test DATE TODAY"
    sleep 1
    so = driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr/td[1]')
    so.each do |t|
    if t.text() == 'New Task - Regression Test Date TODAY' then 
      result = "Pass"
    else 
      result = "Failed to find picklist item"
  end

  def details_onboarding_tasks_breadscrumb
    driver.find_element(css: 'href="/company_tasks"').click
    driver.find_element(css: 'href="/account/picklists"').click
  end

  def details_onboarding_tasks_cancel_add
    river.find_element(css: 'href="/company_tasks"').click
    driver.find_element(id: 'create-company-task-submit').click
    driver.find_element(id: 'company_task_title').sendkeys "New Task - Regression Test DATE TODAY"
    driver.find_element(id: 'company_task_description').sendkeys "Description test for Regression Suite TODAY DATE"
    river.find_element(css: 'href="/company_tasks"').click
  end

#other leave types
  def absence_other_leave_reasons_add #current and employee selectable (default)
    driver.find_element(css: 'href="/company_leave_reasons"').click
    driver.find_element(css: 'href="/company_leave_reasons/new"').click
    driver.find_element(id: 'company_leave_reason_name').sendkeys "New Leave Reason - Test Regression TODAY DATE"
    driver.find_element(xpath: '//*[@id="new_company_leave_reason"]/p/input').click
  end

  def absence_other_leave_reasons_edit
    driver.find_element(css: 'href="/company_leave_reasons"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[4]/a/svg').click
    driver.find_element(id: 'company_leave_reason_name').sendkeys "New Leave Reason - Test Regression TODAY DATE"
    driver.find_element(xpath: '//*[@id="new_company_leave_reason"]/p/input').click
  end
  
  def absence_other_leave_reasons_cancel
    driver.find_element(css: 'href="/company_leave_reasons"').click
    driver.find_element(css: 'href="/company_leave_reasons/new"').click
    driver.find_element(id: 'company_leave_reason_name').sendkeys "New Leave Reason - Test Regression TODAY DATE"
    driver.find_element(css: 'href="/company_leave_reasons"').click
  end
  
  def absence_other_leave_reasons_delete
    driver.find_element(css: 'href="/company_leave_reasons"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[2]/td[4]/svg').click
    driver.find_element(css: '#delete_company_leave_reason_39573 > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm').click #will need to work out to make generic without id
  end
  
  def absence_other_leave_reasons_search
    driver.find_element(css: 'href="/company_leave_reasons"').click
    driver.find_element(css: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "New Leave Reason - Test Regression TODAY DATE"
    sleep 1
    so = driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr/td[1]')
    so.each do |t|
    if t.text() == 'New Task - Regression Test Date TODAY' then 
      result = "Pass"
    else 
      result = "Failed to find picklist item"
  end
  
  def absence_other_leave_reasonsbreadcrumb
    driver.find_element(css: 'href="/company_leave_reasons"').click
    driver.find_element(css: 'href="/account/picklists"').click
  end
  
#sickness types
  def absence_sickness_types_new
    driver.find_element(css: 'href="/company_sicknesstypes"').click
    driver.find_element(css: 'href="/company_sicknesstypes/new"').click
    driver.find_element(id: 'company_sicknesstype_name').sendkeys "Regression New Test DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_sicknesstype"]/p/input').click
  end

  def absence_sickness_types_edit
    driver.find_element(css: 'href="/company_sicknesstypes"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a > svg').click
    driver.find_element(id: 'company_sicknesstype_name').sendkeys "Regression EDIT Test DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_sicknesstype"]/p/input').click
  end

  def absence_sickness_types_cancel_new
    driver.find_element(css: 'href="/company_sicknesstypes"').click
    driver.find_element(css: 'href="/company_sicknesstypes/new"').click
    driver.find_element(id: 'company_sicknesstype_name').sendkeys "Regression New Test DATE TODAY"
    driver.find_element(css: 'href="/company_sicknesstypes"').click
  end

  def absence_sickness_types_delete
    driver.find_element(css: 'href="/company_sicknesstypes"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(5) > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="delete_company_sickness_type_19556"]/div/div/div[3]/button[2]').click #need to sort out sickness id for test account
  end

  def absence_sickness_types_search
    driver.find_element(css: 'href="/company_sicknesstypes"').click
    driver.find_element(css: 'href="/company_sicknesstypes/new"').click
    driver.find_element(id: 'company_sicknesstype_name').sendkeys "Regression New Test DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_sicknesstype"]/p/input').click
  end

  def absence_sickness_types_breadcrumb
    driver.find_element(css: 'href="/company_sicknesstypes"').click
    driver.find_element(css: 'href="/company_sicknesstypes/new"').click
    driver.find_element(id: 'company_sicknesstype_name').sendkeys "Regression New Test DATE TODAY"
    driver.find_element(css: 'href="/account/picklists"').click
  end

#training categories
  def training_categories_new
    driver.find_element(css: 'href="/company_training_categories"').click
    driver.find_element(css: 'href="/company_training_categories/new"').click
    driver.find_element(id: 'company_training_category_name').sendkeys "Regression New training Test DATE TODAY"
    driver.find_element(css: '//*[@id="new_company_training_category"]/p/input').click
  end

  def training_categories_edit
    driver.find_element(css: 'href="/company_training_categories"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[2]/a[1]/svg').click
    driver.find_element(id: 'company_training_category_name').sendkeys "Regression EDIT training Test DATE TODAY"
    driver.find_element(css: '//*[@id="new_company_training_category"]/p/input').click
  end

  def training_categories_cancel
    driver.find_element(css: 'href="/company_training_categories"').click
    driver.find_element(css: 'href="/company_training_categories/new"').click
    driver.find_element(id: 'company_training_category_name').sendkeys "Regression CANCEL training Test DATE TODAY"
    driver.find_element(css: 'href="/company_training_categories"').click
  end

  def training_categories_search
    driver.find_element(css: 'href="/company_training_categories"').click
    driver.find_element(css: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Regression New training Test DATE TODAY"
    sleep 1
  end

  def training_categories_breadcrumb
    driver.find_element(css: 'href="/company_training_categories"').click
    driver.find_element(css: 'href="/account/picklists"').click
  end

#training provider
  def training_providers_new
    driver.find_element(css: 'href="/company_training_providers"').click
    driver.find_element(css: 'href="/company_training_providers/new"').click
    driver.find_element(id: 'company_training_provider_name').sendkeys "Regression Test NEW DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_training_provider"]/p/input').click
  end 

  def training_providers_edit
    driver.find_element(css: 'href="/company_training_providers"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[3]/a/svg').click
    driver.find_element(id: 'company_training_provider_name').sendkeys "Regression Test EDIT DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_training_provider"]/p/input').click
  end 

  def training_providers_cancel_new
    driver.find_element(css: 'href="/company_training_providers"').click
    driver.find_element(css: 'href="/company_training_providers/new"').click
    driver.find_element(id: 'company_training_provider_name').sendkeys "Regression Test CANCEL DATE TODAY"
    driver.find_element(css: 'href="/company_training_providers"').click
  end 

  def training_providers_search
    driver.find_element(css: 'href="/company_training_providers"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Regression Test NEW DATE TODAY"
    sleep 1
  end 

  def training_providers_delete
    driver.find_element(css: 'href="/company_training_providers"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(3) > td.actions > svg > path').click
    driver.find_element(xpath: '//*[@id="delete_provider_7749"]/div/div/div[3]/button[2]').click
  end 

  def training_providers_breadcrumb
    driver.find_element(css: 'href="/company_training_providers"').click
    driver.find_element(css: 'href="/company_training_providers/new"').click
    driver.find_element(css: 'href="/company_training_providers"').click
  end

#training types
  def training_types_new
    driver.find_element(css: 'href="/company_training_types"').click
    driver.find_element(css: 'href="/company_training_types/new"').click
    driver.find_element(id: 'company_training_type_name').sendkeys "Regression Test NEW - DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_training_type"]/p/input').click
  end 
  
  def training_types_edit
    driver.find_element(css: 'href="/company_training_types"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(2) > td.actions > a > svg').click
    driver.find_element(id: 'company_training_type_name').sendkeys "Regression Test EDIT - DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_training_type"]/p/input').click
  end 
  
  def training_types_cancel_new
    driver.find_element(css: 'href="/company_training_types"').click
    driver.find_element(css: 'href="/company_training_types/new"').click
    driver.find_element(id: 'company_training_type_name').sendkeys "Regression Test CANCEL - DATE TODAY"
    driver.find_element(css: 'href="/company_training_types"').click
  end 
  
  def training_types_delete
    driver.find_element(css: 'href="/company_training_types"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(4) > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="delete_type_17139"]/div/div/div[3]/button[2]').click
  end 

  def training_types_breadcrumb
    driver.find_element(css: 'href="/company_training_types"').click
    driver.find_element(css: 'href="/company_training_types/new"').click
    driver.find_element(css: 'href="/company_training_types"').click
  end 

  def training_types_search
    driver.find_element(css: 'href="/company_training_types"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Regression Test NEW - DATE TODAY"
    sleep 1
    #driver.find_element(xpath: '').click
  end 

#departments
  def company_organisation_department_new
    driver.find_element(css: 'href="/company_departments"').click  
    driver.find_element(css: 'href="/company_departments/new"').click
    driver.find_element(id: 'company_department_name').sendkeys "Regression Test NEW - DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_department"]/p/input').click
  end

  def company_organisation_department_edit
    driver.find_element(css: 'href="/company_departments"').click  
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a:nth-child(1) > svg').click
    driver.find_element(id: 'company_department_name').sendkeys "Regression Test EDIT - DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_department"]/p/input').click
  end

  def company_organisation_department_cancel_new
    driver.find_element(css: 'href="/company_departments"').click  
    driver.find_element(css: 'href="/company_departments/new"').click
    driver.find_element(id: 'company_department_name').sendkeys "Regression Test CENCEL - DATE TODAY"
    driver.find_element(css: 'href="/company_departments"').click
  end

  def company_organisation_department_delete
    driver.find_element(css: 'href="/company_departments"').click  
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="delete_department_22750"]/div/div/div[3]/button[2]').click
  end

  def company_organisation_department_breadcrumb
    driver.find_element(css: 'href="/company_departments"').click  
    driver.find_element(css: 'href="/company_departments/new"').click
    driver.find_element(css: 'href="/company_departments"').click
  end

  def company_organisation_department_search
    driver.find_element(css: 'href="/company_departments"').click  
    driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Regression Test NEW - DATE TODAY"
    sleep 1 
    #driver.find_element(xpath: '').click
  end

#divisions
  def company_organisation_division_new
    driver.find_element(css: 'href="/company_divisions"').click
    driver.find_element(css: 'href="/company_divisions/new"').click
    driver.find_element(id: 'company_division_name').sendkeys "Regression Test New - DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_division"]/p/input').click
  end

  def company_organisation_division_edit
    driver.find_element(css: 'href="/company_divisions"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr.odd > td.actions > a > svg').click
    driver.find_element(id: 'company_division_name').sendkeys "Regression Test EDIT - DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_division"]/p/input').click
  end

  def company_organisation_division_cancel_new
    driver.find_element(css: 'href="/company_divisions"').click
    driver.find_element(css: 'href="/company_divisions/new"').click
    driver.find_element(id: 'company_division_name').sendkeys "Regression Test CANCEL - DATE TODAY"
    driver.find_element(css: 'href="/company_divisions"').click
  end

  def company_organisation_division_delete
    driver.find_element(css: 'href="/company_divisions"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr.even > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="delete_division_648"]/div/div/div[3]/button[2]').click
  end

  def company_organisation_division_breadcrumb
    driver.find_element(css: 'href="/company_divisions"').click
    driver.find_element(css: 'href="/company_divisions/new"').click
    driver.find_element(id: 'company_division_name').sendkeys "Regression Test BREADCRUMB - DATE TODAY"
    driver.find_element(css: 'href="/company_divisions"').click
  end

  def company_organisation_division_search
    driver.find_element(css: 'href="/company_divisions"').click
    driver.find_element(css: '').sendkeys "Regression Test New - DATE TODAY"
    sleep 1
  end

#additional payment types
  def pay_and_benefits_additional_payment_types_new
    driver.find_element(css: 'href="/company_additional_payment_types"').click
    driver.find_element(css: 'href="/company_additional_payment_types/new"').click
    driver.find_element(id: 'company_additional_payment_type_name').sendkeys "Regression Test NEW - DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_additional_payment_type"]/p/input').click
  end

  def pay_and_benefits_additional_payment_types_edit
    driver.find_element(css: 'href="/company_additional_payment_types"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a > svg').click
    driver.find_element(id: 'company_additional_payment_type_name').sendkeys "Regression Test EDIT - DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_additional_payment_type"]/p/input').click
  end

  def pay_and_benefits_additional_payment_types_cancel_new
    driver.find_element(css: 'href="/company_additional_payment_types"').click
    driver.find_element(css: 'href="/company_additional_payment_types/new"').click
    driver.find_element(id: 'company_additional_payment_type_name').sendkeys "Regression Test CANCEL - DATE TODAY"
    driver.find_element(css: 'href="/company_additional_payment_types"').click
  end

  def pay_and_benefits_additional_payment_types_delete
    driver.find_element(css: 'href="/company_additional_payment_types"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(3) > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="delete_company_additional_payment_type_11395"]/div/div/div[3]/button[2]').click
  end

  def pay_and_benefits_additional_payment_types_breadcrumb
    driver.find_element(css: 'href="/company_additional_payment_types"').click
    driver.find_element(css: 'href="/company_additional_payment_types/new"').click
    driver.find_element(id: 'company_additional_payment_type_name').sendkeys "Regression Test BREADCRUMB - DATE TODAY"
    driver.find_element(css: 'href="/company_additional_payment_types"').click
  end

  def pay_and_benefits_additional_payment_types_search
    driver.find_element(css: 'href="/company_additional_payment_types"').click
    driver.find_element(css: 'href="/company_additional_payment_types/new"').sendkeys "Regression Test NEW - DATE TODAY"
    sleep 1 
    #driver.find_element(xpath: '').click
  end

#benefit types
  def pay_and_benefits_benefit_types_new
    driver.find_element(css: 'href="/company_benefit_types"').click
    driver.find_element(css: 'href="/company_benefit_types/new"').click
    driver.find_element(id: 'company_benefit_type_name').sendkeys "Regression Test NEW - DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_benefit_type"]/p/input').click
  end

  def pay_and_benefits_benefit_types_edit
    driver.find_element(css: 'href="/company_benefit_types"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a > svg').click
    driver.find_element(id: 'company_benefit_type_name').sendkeys "Regression Test NEW - DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_benefit_type"]/p/input').click
  end

  def pay_and_benefits_benefit_types_cancel_new
    driver.find_element(css: 'href="/company_benefit_types"').click
    driver.find_element(css: 'href="/company_benefit_types/new"').click
    driver.find_element(id: 'company_benefit_type_name').sendkeys "Regression Test NEW - DATE TODAY"
    driver.find_element(css: 'href="/company_benefit_types"').click
  end

  def pay_and_benefits_benefit_types_delete
    driver.find_element(css: 'href="/company_benefit_types"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(4) > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="delete_company_benefit_type_11320"]/div/div/div[3]/button[2]').click
  end

  def pay_and_benefits_benefit_types_breadcrumb
    driver.find_element(css: 'href="/company_benefit_types"').click
    driver.find_element(css: 'href="/company_benefit_types/new"').click
    driver.find_element(id: 'company_benefit_type_name').sendkeys "Regression Test NEW - DATE TODAY"
    driver.find_element(css: 'href="/company_benefit_types"').click
  end

  def pay_and_benefits_benefit_types_search
    driver.find_element(css: 'href="/company_benefit_types"').click
    driver.find_element(css: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Regression Test NEW - DATE TODAY"
    sleep 1
    driver.find_element(xpath: '').click
  end

#expense types
  def pay_and_benefits_expense_types_new
    driver.find_element(css: 'href="/company_expense_types"').click
    driver.find_element(css: 'href="/company_expense_types/new"').click
    driver.find_element(id: 'company_expense_type_name').sendkeys "Regression Test NEW DATE TODAY"
    driver.find_element(id: 'company_expense_type_code').sendkeys "Regression Test NEW DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_expense_type"]/p/input').click
  end
  
  def pay_and_benefits_expense_types_edit
    driver.find_element(css: 'href="/company_expense_types"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a > svg').click
    driver.find_element(id: 'company_expense_type_name').sendkeys "Regression Test EDIT DATE TODAY"
    driver.find_element(id: 'company_expense_type_code').sendkeys "Regression Test EDIT DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_expense_type"]/p/input').click
  end

  def pay_and_benefits_expense_types_cancel_new
    driver.find_element(css: 'href="/company_expense_types"').click
    driver.find_element(css: 'href="/company_expense_types/new"').click
    driver.find_element(id: 'company_expense_type_name').sendkeys "Regression Test CANCEL NEW DATE TODAY"
    driver.find_element(id: 'company_expense_type_code').sendkeys "Regression Test CANCEL NEW DATE TODAY"
    driver.find_element(css: 'href="/company_expense_types"').click
  end

  def pay_and_benefits_expense_types_delete
    driver.find_element(css: 'href="/company_expense_types"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(6) > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="company_expense_type_22634"]/div/div/div[3]/button[2]').click
  end

  def pay_and_benefits_expense_types_search
    driver.find_element(css: 'href="/company_expense_types"').click
    driver.find_element(id: 'company_expense_type_name').sendkeys ""
    sleep 1
  end

  def pay_and_benefits_expense_types_breadcrumb
    driver.find_element(css: 'href="/company_expense_types"').click
    driver.find_element(css: 'href="/company_expense_types/new"').click
    driver.find_element(css: 'href="/company_expense_types"').click
  end

#mileage rates
  def pay_and_benefits_mileage_rates_new
    driver.find_element(css: 'href="/company_mileage_rates"').click
    driver.find_element(css: 'href="/company_mileage_rates/new"').click
    driver.find_element(id: 'company_mileage_rate_rate').sendkeys "0.85" #rate is current by default
    driver.find_element(xpath: '//*[@id="new_company_mileage_rate"]/p/input').click
  end

  def pay_and_benefits_mileage_rates_edit
    driver.find_element(css: 'href="/company_mileage_rates"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr.odd > td.actions > a:nth-child(1) > svg').click
    driver.find_element(id: 'company_mileage_rate_rate').sendkeys "1.30" #rate is current by default
    driver.find_element(xpath: '//*[@id="new_company_mileage_rate"]/p/input').click
  end

  def pay_and_benefits_mileage_rates_cancel_new
    driver.find_element(css: 'href="/company_mileage_rates"').click
    driver.find_element(css: 'href="/company_mileage_rates/new"').click
    driver.find_element(id: 'company_mileage_rate_rate').sendkeys "101.11" #rate is current by default
    driver.find_element(css: 'href="/company_mileage_rates"').click
  end

  def pay_and_benefits_mileage_rates_delete
    driver.find_element(css: 'href="/company_mileage_rates"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr.odd > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="company_mileage_rate_14"]/div/div/div[3]/button[2]').click
  end

  def pay_and_benefits_mileage_rates_search
    driver.find_element(css: 'href="/company_mileage_rates"').click
    driver.find_element(css: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys
    sleep 1
  end

  def pay_and_benefits_mileage_rates_breadcrumb
    driver.find_element(css: 'href="/company_mileage_rates"').click
    driver.find_element(css: 'href="/company_mileage_rates/new"').click
    driver.find_element(css: 'href="/company_mileage_rates"').click
  end

#applicant stages
  def recruitment_applicant_stages_new
    driver.find_element(css: 'href="/recruitment/applicant_stages"').click
    driver.find_element(css: 'href="/recruitment/applicant_stages/new"').click
    driver.find_element(id: 'applicant_stage_name').sendkeys "Regression Test NEW DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_applicant_stage"]/p/input').click
  end

  def recruitment_applicant_stages_edit
    driver.find_element(css: 'href="/recruitment/applicant_stages"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(3) > td.actions > a:nth-child(1) > svg').click
    driver.find_element(id: 'applicant_stage_name').sendkeys "Regression Test EDIT DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_applicant_stage"]/p/input').click
  end

  def recruitment_applicant_stages_cancel_new
    driver.find_element(css: 'href="/recruitment/applicant_stages"').click
    driver.find_element(css: 'href="/recruitment/applicant_stages/new"').click
    driver.find_element(id: 'applicant_stage_name').sendkeys "Regression Test CANCEL DATE TODAY"
    driver.find_element(css: 'href="/recruitment/applicant_stages"').click
  end

  def recruitment_applicant_stages_breadcrumb
    driver.find_element(css: 'href="/recruitment/applicant_stages"').click
    driver.find_element(css: 'href="/recruitment/applicant_stages/new"').click
    driver.find_element(css: 'href="/recruitment/applicant_stages"').click
  end

  def recruitment_applicant_stages_delete
    driver.find_element(css: 'href="/recruitment/applicant_stages"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(3) > td.actions > svg').click
    driver.find_element(css: '#delete_type_11782 > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm').click
  end

  def recruitment_applicant_stages_search
    driver.find_element(css: 'href="/recruitment/applicant_stages"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Regression Test NEW DATE TODAY"
    sleep 1
  end

#applicant emails
  def recruitment_applicant_email_edit
    driver.find_element(css: 'href="/recruitment/applicant_stages/emails_index"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a > svg').click
    driver.find_element(id: 'applicant_stage_email_subject').sendkeys "Regression Test EDIT applicant email DATE TODAY"
    driver.find_element(id: 'applicant_stage_email_text').sendkeys "Dear Applicant, REgression test has updateed the body of this email DATE TODAY"
    driver.find_element(xpath: '//*[@id="edit_applicant_stage_9927"]/p/input').click
  end

  def recruitment_applicant_email_edit_cancel
    driver.find_element(css: 'href="/recruitment/applicant_stages/emails_index"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a > svg').click
    driver.find_element(id: 'applicant_stage_email_subject').sendkeys "Regression Test EDIT applicant email DATE TODAY"
    driver.find_element(id: 'applicant_stage_email_text').sendkeys "Dear Applicant, REgression test has updateed the body of this email DATE TODAY"
    driver.find_element(xpath: '//*[@id="edit_applicant_stage_9927"]/p/a').click
  end

#applicant sources
 def recruitment_applicant_source_new
    driver.find_element(css: 'href="/applicant_sources"').click
    driver.find_element(css: 'href="/applicant_sources/new"').click
    driver.find_element(id: 'applicant_source_name').sendkeys "Regression Test NEW DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_applicant_source"]/p/input').click
  end

  def recruitment_applicant_source_cancel_new
    driver.find_element(css: 'href="/applicant_sources"').click
    driver.find_element(css: 'href="/applicant_sources/new"').click
    driver.find_element(id: 'applicant_source_name').sendkeys "Regression Test CANCEL DATE TODAY"
    driver.find_element(css: 'href="/applicant_sources"').click
  end

  def recruitment_applicant_source_edit
    driver.find_element(css: 'href="/applicant_sources"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a:nth-child(1) > svg').click
    driver.find_element(id: 'applicant_source_name').sendkeys "Regression Test EDIT DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_applicant_source"]/p/input').click
  end

  def recruitment_applicant_source_delete
    driver.find_element(css: 'href="/applicant_sources"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[2]/svg').click
  end

  def recruitment_applicant_source_search
    driver.find_element(css: 'href="/applicant_sources"').click
    driver.find_element(css: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Agency"
    sleep 1
    #driver.find_element(xpath: '').click
  end

#disciplinary outcomes
  def performance_management_disciplinary_outcomes_new
    driver.find_element(css: 'href="/company_disciplinary_outcomes"').click
    driver.find_element(css: 'href="/company_disciplinary_outcomes/new"').click
    driver.find_element(id: 'company_disciplinary_outcome_name').sendkeys "Regression Test - NEW DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_disciplinary_outcome"]/p/input').click
  end

  def performance_management_disciplinary_outcomes_edit
    driver.find_element(css: 'href="/company_disciplinary_outcomes"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a:nth-child(1) > svg').click
    driver.find_element(id: 'company_disciplinary_outcome_name').sendkeys "Regression Test - EDIT DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_disciplinary_outcome"]/p/input').click
  end

  def performance_management_disciplinary_outcomes_cancel_new
    driver.find_element(css: 'href="/company_disciplinary_outcomes"').click
    driver.find_element(css: 'href="/company_disciplinary_outcomes/new"').click
    driver.find_element(id: 'company_disciplinary_outcome_name').sendkeys "Regression Test - NEW DATE TODAY"
    driver.find_element(css: 'href="/company_disciplinary_outcomes/new"').click
  end

  def performance_management_disciplinary_outcomes_delete
    driver.find_element(css: 'href="/company_disciplinary_outcomes"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="delete_type_19803"]/div/div/div[3]/button[2]').click
  end

  def performance_management_disciplinary_outcomes_search
    driver.find_element(css: 'href="/company_disciplinary_outcomes"').click
    driver.find_element(id: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Regression Test - NEW DATE TODAY"
    sleep 1
  end

  def performance_management_disciplinary_outcomes_breadcrumb
    driver.find_element(css: 'href="/company_disciplinary_outcomes"').click
    driver.find_element(css: 'href="/company_disciplinary_outcomes/new"').click
    driver.find_element(id: 'company_disciplinary_outcome_name').sendkeys "Regression Test - BREADCRUMB DATE TODAY"
    driver.find_element(css: 'href="/company_disciplinary_outcomes"').click
  end

#grievence outcomes
  def performance_management_grievance_outcomes_new
    driver.find_element(css: 'href="/company_grievance_outcomes"').click
    driver.find_element(css: 'href="/company_grievance_outcomes/new"').click
    driver.find_element(id: 'company_grievance_outcome_name').sendkeys "Regression Test NEW DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_grievance_outcome"]/p/input').click
  end
  
  def performance_management_grievance_outcomes_edit
    driver.find_element(css: 'href="/company_grievance_outcomes"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a:nth-child(1) > svg').click
    driver.find_element(id: 'company_grievance_outcome_name').sendkeys "Regression Test EDIT DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_grievance_outcome"]/p/input').click
  end
  
  def performance_management_grievance_outcomes_cancel_new
    driver.find_element(css: 'href="/company_grievance_outcomes"').click
    driver.find_element(css: 'href="/company_grievance_outcomes/new"').click
    driver.find_element(id: 'company_grievance_outcome_name').sendkeys "Regression Test CANCEL NEW DATE TODAY"
    driver.find_element(css: 'href="/company_grievance_outcomes"').click
  end

  def performance_management_grievance_outcomes_delete
    driver.find_element(css: 'href="/company_grievance_outcomes"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="delete_type_8488"]/div/div/div[3]/button[2]').click
  end

  def performance_management_grievance_outcomes_search
    driver.find_element(css: 'href="/company_grievance_outcomes"').click
    driver.find_element(css: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Regression Test NEW DATE TODAY"
    sleep 1 
  end

  def performance_management_grievance_outcomes_breadcrumb
    driver.find_element(css: 'href="/company_grievance_outcomes"').click
    driver.find_element(css: 'href="/company_grievance_outcomes/new"').click
    driver.find_element(id: 'company_grievance_outcome_name').sendkeys "Regression Test BREADCRUMB DATE TODAY"
    driver.find_element(css: 'href="/company_grievance_outcomes"').click
  end

#one to ones
  def performance_management_one_to_one_types_new
    driver.find_element(css: 'href="/company_one_to_one_types"').click
    driver.find_element(css: 'href="/company_one_to_one_types/new"').click
    driver.find_element(id: 'company_one_to_one_type_name').sendkeys "Regression Test NEW DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_one_to_one_type"]/p/input').click
  end

  def performance_management_one_to_one_types_edit
    driver.find_element(css: 'href="/company_one_to_one_types"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a > svg').click
    driver.find_element(id: 'company_one_to_one_type_name').sendkeys "Regression Test EDIT DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_one_to_one_type"]/p/input').click
  end

  def performance_management_one_to_one_types_cancel_new
    driver.find_element(css: 'href="/company_one_to_one_types"').click
    driver.find_element(css: 'href="/company_one_to_one_types/new"').click
    driver.find_element(id: 'company_one_to_one_type_name').sendkeys "Regression Test CANCEL NEW DATE TODAY"
    driver.find_element(xpath: '').click
  end
  
  def performance_management_one_to_one_types_delete
    driver.find_element(css: 'href="/company_one_to_one_types"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(3) > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="delete_type_22634"]/div/div/div[3]/button[2]').click
  end
  
  def performance_management_one_to_one_types_search
    driver.find_element(css: 'href="/company_one_to_one_types"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Regression Test NEW DATE TODAY"
    sleep 1
  end

  def performance_management_one_to_one_types_search_breadcrumb
    driver.find_element(css: 'href="/company_one_to_one_types"').click
    driver.find_element(css: 'href="/company_one_to_one_types/new"').click
    driver.find_element(id: 'company_one_to_one_type_name').sendkeys "Regression Test BREADCRUMB TODAY"
    driver.find_element(css: 'href="/company_one_to_one_types"').click
  end

#email notifications
  def system_notifications_on
    driver.find_element(id: 'account_email_notifications_enabled_1').click
  end

  def system_notifications_off
    driver.find_element(id: 'account_email_notifications_enabled_0').click
  end

  def third_party_email_invoice
    driver.find_element(id: 'account_copy_invoice_email_address').sendkeys "reguser@email.com"
    driver.find_element(xpath: '//*[@id="edit_account_2869"]/p/input').click  #will need to amend to id of company
  end 

  def third_party_email_leave_request_approval
    driver.find_element(id: 'account_third_party_holiday_recipient').sendkeys "reguser@email.com"
    driver.find_element(xpath: '//*[@id="edit_account_2869"]/p/input').click  #will need to amend to id of company
  end 
  
  def third_party_email_approved_expenses
    driver.find_element(id: 'account_expense_payer_email').sendkeys "reguser@email.com"
    driver.find_element(xpath: '//*[@id="edit_account_2869"]/p/input').click  #will need to amend to id of company
  end 

#2FA
  def twofa_everyone_on
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/div/div[3]/div[2]/div/div/label[1]').click
  end 

  def twofa_everyone_off
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/div/div[3]/div[2]/div/div/label[2]').click
  end 

  def twofa_hrusers_on
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/div/div[4]/div[2]/div/div/label[1]').click
  end

  def twofa_hrusers_off
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/div/div[4]/div[2]/div/div/label[2]').click
  end

  def twofa_line_manager_on
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/div/div[5]/div[2]/div/div/label[1]').click
  end

  def twofa_line_manager_off
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/div/div[5]/div[2]/div/div/label[2]').click
  end

  def twofa_financeusers_on
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/div/div[6]/div[2]/div/div/label[1]').click
  end

  def twofa_financeusers_off
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/div/div[6]/div[2]/div/div/label[2]').click
  end

#hr_user_configuration
  def hr_user_configuration_leave_needs_approval_on
    driver.find_element(id: 'account_hr_leave_needs_approval').click
  end

  def hr_user_configuration_leave_needs_approval_off
    driver.find_element(: '').click
  end

  def hr_user_configuration_use_gravatar_on
    driver.find_element(id: 'account_use_gravatar').click
  end

  def hr_user_configuration_use_gravatar_off
    driver.find_element(id: 'account_use_gravatar').click
  end

  def hr_user_configuration_disable_welcome_page_on
    driver.find_element(id: 'account_getting_started_finished').click
  end

  def hr_user_configuration_disable_welcome_page_off
    driver.find_element(id: 'account_getting_started_finished').click
  end

  def hr_user_configuration_use_bradford_factor_on
    driver.find_element(id: 'account_use_bradford_factor').click
  end

  def hr_user_configuration_use_bradford_factor_off
    driver.find_element(id: 'account_use_bradford_factor').click
  end

  def hr_user_configuration_remind_line_manager_to_give_121_on
    driver.find_element(id: 'one-to-one-frequency-checkbox').click
    driver.find_element(id: 'account_one_to_one_frequency').sendkeys "5"
  end

  def hr_user_configuration_remind_line_manager_to_give_121_off
    driver.find_element(id: 'one-to-one-frequency-checkbox').click
  end

  def hr_user_configuration_grapevine_label
    driver.find_element(id: 'account_grapevine_label').senkeys "Regression Test add value DATE TODAY"
  end

  def update_hr_settings
    driver.find_element(class: 'btn btn-success').click
  end

  def cancel_hr_settings
    driver.find_element(css: 'href="/account/settings"').click
  end
s
#line manager configuration
  def line_manager_configuration_on_profile_manage
    driver.find_element(id: 'account_line_manager_privilege_profile_save').click
  end

  def line_manager_configuration_on_profile_delete_docs_only
    driver.find_element(id: 'account_line_manager_privilege_profile_delete').click
  end

  def line_manager_configuration_on_personal_profile_view
    driver.find_element(id: 'account_line_manager_privilege_personal_profile_show').click
  end

  def line_manager_configuration_on_personal_profile_manage
    driver.find_element(id: 'account_line_manager_privilege_personal_profile_save').click
  end

  def line_manager_configuration_on_leave_view
    driver.find_element(id: 'account_line_manager_privilege_leave_show').click
  end

  def line_manager_configuration_on_leave_manage
    driver.find_element(id: 'account_line_manager_privilege_leave_save').click
  end

  def line_manager_configuration_on_leave_delete
    driver.find_element(id: 'account_line_manager_privilege_leave_delete').click
  end

  def line_manager_configuration_on_adjustments_and_toil_view
    driver.find_element(id: 'account_line_manager_privilege_adjustments_show').click
  end

  def line_manager_configuration_on_adjustments_and_toil_manage
    driver.find_element(id: 'account_line_manager_privilege_adjustments_save').click
  end

  def line_manager_configuration_on_sickness_view
    driver.find_element(id: 'account_line_manager_privilege_sickness_show').click
  end

  def line_manager_configuration_on_sickness_manage
    driver.find_element(id: 'account_line_manager_privilege_sickness_save').click
  end

  def line_manager_configuration_on_sickness_delete
    driver.find_element(id: 'account_line_manager_privilege_sickness_delete').click
  end

  def line_manager_configuration_on_training_view
    driver.find_element(id: 'account_line_manager_privilege_training_show').click
  end

  def line_manager_configuration_on_training_manage
    driver.find_element(id: 'account_line_manager_privilege_training_save').click
  end

  def line_manager_configuration_on_training_delete
    driver.find_element(id: 'account_line_manager_privilege_training_delete').click
  end

  def line_manager_configuration_on_one_to_ones_view
    driver.find_element(id:'account_line_manager_privilege_one_to_ones_show').click
  end

  def line_manager_configuration_on_one_to_ones_manage
    driver.find_element(id:'account_line_manager_privilege_one_to_ones_save').click
  end

  def line_manager_configuration_on_one_to_ones_delete
    driver.find_element(id: 'account_line_manager_privilege_one_to_ones_delete').click
  end

  def line_manager_configuration_on_objectives_view
    driver.find_element(id: 'account_line_manager_privilege_objectives_show').click
  end

  def line_manager_configuration_on_objectives_manage
    driver.find_element(id: 'account_line_manager_privilege_objectives_save').click
  end

  def line_manager_configuration_on_objectives_delete
    driver.find_element(id: 'account_line_manager_privilege_objectives_delete').click
  end

  def line_manager_configuration_on_deliverables_view
    driver.find_element(id: 'account_line_manager_privilege_deliverables_show').click
  end

  def line_manager_configuration_on_deliverables_manage
    driver.find_element(id: 'account_line_manager_privilege_deliverables_save').click
  end

  def line_manager_configuration_on_deliverables_delete
    driver.find_element(id: 'account_line_manager_privilege_deliverables_delete').click
  end

  def line_manager_configuration_on_job_details_view
    driver.find_element(id: 'account_line_manager_privilege_job_details_show').click
  end

  def line_manager_configuration_on_job_details_manage
    driver.find_element(id: 'account_line_manager_privilege_job_details_save').click
  end

  def line_manager_configuration_on_job_details_delete
    driver.find_element(id: 'account_line_manager_privilege_job_details_delete').click
  end

  def line_manager_configuration_on_remuneration_view
    driver.find_element(id: 'account_line_manager_privilege_remuneration_show').click
  end

  def line_manager_configuration_on_remuneration_manage
    driver.find_element(id: 'account_line_manager_privilege_remuneration_save').click
  end

  def line_manager_configuration_on_remuneration_delete
    driver.find_element(id: 'account_line_manager_privilege_remuneration_delete').click
  end

  def line_manager_configuration_on_emergency_contacts_view
    driver.find_element(id: 'account_line_manager_privilege_emergency_contacts_show').click
  end

  def line_manager_configuration_on_emergency_contacts_manage
    driver.find_element(id: 'account_line_manager_privilege_emergency_contacts_save').click
  end

  def line_manager_configuration_on_emergency_contacts_delete
    driver.find_element(id: 'account_line_manager_privilege_emergency_contacts_delete').click
  end

  def line_manager_configuration_on_medical_facts_view
    driver.find_element(id: 'account_line_manager_privilege_medical_facts_show').click
  end

  def line_manager_configuration_on_medical_facts_manage
    driver.find_element(id: 'account_line_manager_privilege_medical_facts_save').click
  end

  def line_manager_configuration_on_medical_facts_delete
    driver.find_element(id: 'account_line_manager_privilege_medical_facts_delete').click
  end

  def line_manager_configuration_on_personal_history_view
    driver.find_element(id: 'account_line_manager_privilege_personal_history_show').click
  end

  def line_manager_configuration_on_personal_history_manage
    driver.find_element(id: 'account_line_manager_privilege_personal_history_save').click
  end

  def line_manager_configuration_on_personal_history_delete
    driver.find_element(id: 'account_line_manager_privilege_personal_history_delete').click
  end

  def line_manager_configuration_on_notes_view
    driver.find_element(id: 'account_line_manager_privilege_notes_show').click
  end
  
  def line_manager_configuration_on_notes_manage
    driver.find_element(id: 'account_line_manager_privilege_notes_save').click
  end

  def line_manager_configuration_on_notes_delete
    driver.find_element(id: 'account_line_manager_privilege_notes_delete').click
  end

  def line_manager_configuration_on_equipment_view
    driver.find_element(id: 'account_line_manager_privilege_assets_show').click
  end

  def line_manager_configuration_on_equipment_manage
    driver.find_element(id: 'account_line_manager_privilege_assets_save').click
  end

  def line_manager_configuration_on_equipment_delete
    driver.find_element(id: 'account_line_manager_privilege_assets_delete').click
  end

  def line_manager_configuration_on_id_documents_view
    driver.find_element(id: 'account_line_manager_privilege_id_documents_show').click
  end
  
  def line_manager_configuration_on_id_documents_manage
    driver.find_element(id: 'account_line_manager_privilege_id_documents_save').click
  end

  def line_manager_configuration_on_id_documents_delete
    driver.find_element(id: 'account_line_manager_privilege_id_documents_delete').click
  end

  def line_manager_configuration_on_dbs_checks_view
    driver.find_element(id: 'account_line_manager_privilege_crb_checks_show').click
  end

  def line_manager_configuration_on_dbs_checks_manage
    driver.find_element(id: 'account_line_manager_privilege_crb_checks_save').click
  end

  def line_manager_configuration_on_dbs_checks_delete
    driver.find_element(id: 'account_line_manager_privilege_crb_checks_delete').click
  end

  def line_manager_configuration_on_grievances_and_disciplinaries_view
    driver.find_element(id: 'account_line_manager_privilege_grievances_show').click
  end

  def line_manager_configuration_on_grievances_and_disciplinaries_manage
    driver.find_element(id: 'account_line_manager_privilege_grievances_save').click
  end

  def line_manager_configuration_on_grievances_and_disciplinaries_delete
    driver.find_element(id: 'account_line_manager_privilege_grievances_delete').click
  end

  def line_manager_configuration_on_time_logs_view
    driver.find_element(id: 'account_line_manager_privilege_time_logs_show').click
  end

  def line_manager_configuration_on_time_logs_manage
    driver.find_element(id: 'account_line_manager_privilege_time_logs_save').click
  end

  def line_manager_configuration_on_time_logs_delete
    driver.find_element(id: 'account_line_manager_privilege_time_logs_delete').click
  end

  def line_manager_configurations_update
    driver.find_element(xpath: '//*[@id="edit_account_line_manager_privilege_2827"]/div[2]/div/p/input').click
  end

  def line_manager_configurations_cancel
    driver.find_element(css: 'href="/account/settings"').click
  end

  def line_manager_able_to_see_their_peoples_people
    driver.find_element(id: 'line_manager_levels').click
  end

  def line_manage_able_to_see_their_peoples_bank_details
    driver.find_element(id: 'line_managers_see_bank').click
  end

#employee configuration
  def employee_congifuration_what_can_see_remunerations
    driver.find_element(id: 'account_employees_see_remuneration').click
  end

  def employee_congifuration_what_can_see_performance_metrics
    driver.find_element(id: 'account_performance_metrics').click
  end

  def employee_congifuration_what_can_see_custom_fields
    driver.find_element(id: 'account_employees_see_custom_fields').click
  end

  def employee_congifuration_what_can_see_directory
    driver.find_element(id: 'account_employees_directory').click
  end

  def employee_congifuration_what_can_see_calendar
    driver.find_element(id: 'account_employees_can_see_calendar').click
  end

  def employee_congifuration_what_can_see_kudus_leaderboard
    driver.find_element(id: 'account_employees_can_view_kudos_leaderboard').click
  end

  def employee_congifuration_what_can_see_location_booking_report
    driver.find_element(id: 'account_employees_can_view_location_bookings_report').click
  end

  def employee_congifuration_what_can_do_update_profile_picture
    driver.find_element(id: 'account_employees_can_change_avatar').click
  end

  def employee_congifuration_what_can_do_request_toil
    driver.find_element(id: 'account_employees_see_toil').click
  end

  def employee_congifuration_what_can_do_report_sickness
    driver.find_element(id: 'account_employees_can_report_sickness').click
  end

  def employee_congifuration_what_can_do_request_one_to_ones
    driver.find_element(id: 'account_employees_can_request_one_to_ones').click
  end

  def employee_congifuration_what_can_do_enter_traiining_record
    driver.find_element(id: 'account_employees_can_enter_training').click
  end

  def employee_congifuration_what_can_do_booking_locations
    driver.find_element(id: 'account_employees_can_book_locations').click
  end

  def employee_congifuration_update
    driver.find_element(id: '//*[@id="edit_account_2869"]/p/input').click
  end

  def employee_congifuration_cancel
    driver.find_element(css: 'href="/account/settings"').click
  end

  


end









