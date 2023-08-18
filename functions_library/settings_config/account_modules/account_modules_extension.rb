require File.expand_path('../../../base.rb', __FILE__)

class AccountModulesExtension < Base
  def modules_chargable_switch_on
    #Expenses
    driver.find_element(id: 'account_use_expenses_1').click
    #Recruitment - std
    driver.find_element(id: 'account_recruitment_standard').click
    #Learn
    driver.find_element(id: 'account_use_learn_1').click
    #Rota, Time & Attendance
    driver.find_element(id: 'account_use_rta_1').click
    sleep 0.25
    driver.find_element(css: '#enable-rta-modal .modal-confirm').click
    driver.find_element(id: 'update-chargeable-modules-btn').click
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
end
