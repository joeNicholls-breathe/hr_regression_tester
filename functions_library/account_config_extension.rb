require File.expand_path('../base.rb', __FILE__)

class AccountConfigExtension < Base
  def navigate_to_company_details
    driver.find_element(css: 'href="/account"').click
  end

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

  def navigate_back_to_settings_breadcrumb
    driver.find_element(css: 'href="/account/settings"').click
  end

  def navigate_to_modules_chargable
    driver.find_element(css: 'href="/account/modules"').click
  end

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
end
