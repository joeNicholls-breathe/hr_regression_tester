require File.expand_path('../../../base.rb', __FILE__)

class AccountPicklistExtension < Base
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
    driver.find_element(xpath: '//*[@id="delete_ethnicity"]/div/div/div[3]/button[2]').click
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
    driver.find_element(css: '#edit_gender > p > input').click
  end

#gender
  def details_genders_edit
    driver.find_element(css: 'href="/genders"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr.odd > td.actions > a').click
    driver.find_element(id: 'gender_name').sendkeys "Other"
    driver.find_element(css: '#edit_gender > p > input').click
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
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[3]/a[1]').click
    driver.find_element(id:'company_kudos_type_name').sendkeys "Regression test edit TODAY DATE"
    driver.find_element(xpath:'//*[@id="new_company_kudos_type"]/p/input').click
  end

  def details_kudos_types_delete
    driver.find_element(css: 'href="/company_kudos_types"').click
    driver.find_element(xpath:'//*[@id="DataTables_Table_0"]/tbody/tr[3]/td[3]/svg').click
    driver.find_element(xpath:'//*[@id="delete_company_kudos_type"]/div/div/div[3]/button[2]').click
  end

  def details_kudos_types_search
    driver.find_element(css: 'href="/company_kudos_types"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Awesome service"
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
    #driver.find_element(:'').
  end

  def details_notice_periods_search
    driver.find_element(css: 'href="/company_noticeperiods"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "1"
    sleep 1
  end

  def details_notice_periods_breadcrumb
    driver.find_element(css: 'href="/company_noticeperiods"').click
    driver.find_element(css:'href="/company_noticeperiods/new"').click
    driver.find_element(xpath:'//*[@id="delete_noticeperiod"]/div/div/div[3]/button[2]').click
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
    #driver.find_element(: '').
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

  #def details_onboarding_tasks_search #this will need to be reviewed
  #  driver.find_element(css: 'href="/company_tasks"').click
  #  driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "New Task - Regression Test DATE TODAY"
  #  sleep 1
  #  so = driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr/td[1]')
  #  so.each do |t|
  #  if t.text() == 'New Task - Regression Test Date TODAY' then 
  #    result = "Pass"
  #  else 
  #    result = "Failed to find picklist item"
  #end

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
    driver.find_element(css: '#delete_company_leave_reason > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm').click #will need to work out to make generic without id
  end
  
  #def absence_other_leave_reasons_search
  #  driver.find_element(css: 'href="/company_leave_reasons"').click
  #  driver.find_element(css: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "New Leave Reason - Test Regression TODAY DATE"
  #  sleep 1
  #  so = driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr/td[1]')
  #  so.each do |t|
  #  if t.text() == 'New Task - Regression Test Date TODAY' then 
  #    result = "Pass"
  #  else 
  #    result = "Failed to find picklist item"
  #end
  
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
    driver.find_element(xpath: '//*[@id="delete_company_sickness_type"]/div/div/div[3]/button[2]').click #need to sort out sickness id for test account
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
    driver.find_element(xpath: '//*[@id="delete_provider"]/div/div/div[3]/button[2]').click
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
    driver.find_element(xpath: '//*[@id="delete_type"]/div/div/div[3]/button[2]').click
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
    driver.find_element(xpath: '//*[@id="delete_department"]/div/div/div[3]/button[2]').click
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
    driver.find_element(xpath: '//*[@id="delete_division"]/div/div/div[3]/button[2]').click
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
    driver.find_element(xpath: '//*[@id="delete_company_additional_payment_type"]/div/div/div[3]/button[2]').click
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
    driver.find_element(xpath: '//*[@id="delete_company_benefit_type"]/div/div/div[3]/button[2]').click
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
end
