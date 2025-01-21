# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/ClassLength
class AccountModulesExtension < Base
  def expenses_trial_on
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-expenses]').click
    sleep 1
    element = driver.find_element(xpath: '/html/body/div[3]/div/section/div/div/div[2]/div/footer/a')
    driver.execute_script('arguments[0].scrollIntoView(true);', element)
    sleep 0.5
    driver.find_element(css: 'body > div.hr-main-container > div > section > div > div >
      div.advert-main > div > footer > a').click
  end

  def recruitment_trial_on
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-recruitment]').click
    sleep 1
    element = driver.find_element(xpath: '/html/body/div[3]/div/section/div/div/div[2]/div/footer/a')
    driver.execute_script('arguments[0].scrollIntoView(true);', element)
    sleep 0.5
    driver.find_element(css: 'body > div.hr-main-container > div > section > div > div >
      div.advert-main > div > footer > a').click
  end

  def rota_trial_on
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-rota]').click
    sleep 1
    element = driver.find_element(xpath: '/html/body/div[3]/div/section/div/div/div[2]/div/footer/a')
    driver.execute_script('arguments[0].scrollIntoView(true);', element)
    sleep 0.5
    driver.find_element(css: 'body > div.hr-main-container > div > section > div > div >
      div.advert-main > div > footer > a').click
  end

  def learn_trial_on
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-learn]').click
    sleep 1
    element = driver.find_element(xpath: '/html/body/div[3]/div/section/div/div/div[2]/div/footer/a')
    driver.execute_script('arguments[0].scrollIntoView(true);', element)
    sleep 0.5
    driver.find_element(css: 'body > div.hr-main-container > div > section > div > div >
      div.advert-main > div > footer > a').click
  end

  def modules_chargable_switch_off
    # Expenses
    driver.find_element(id: 'account_use_expenses_0').click
    sleep 0.5
    driver.find_element(css: '#expenses-off-confirmation > div > div > div.modal-footer > button.btn.btn-danger').click
    sleep 0.5
    driver.find_element(xpath: '//*[@id="delete-expenses-modal"]/div/div/div[2]/input').click
    sleep 0.5
    driver.find_element(css: '#edit_account_3899 > input.btn.btn-danger.modal-confirm').click
    sleep 0.5
    # Recruitment
    driver.find_element(id: 'account_use_recruitment_0').click
    sleep 1
    driver.find_element(id: 'update-chargeable-modules-btn').click
    sleep 1
    # Learn
    driver.find_element(id: 'account_use_learn_0').click
    sleep 1
    driver.find_element(xpath: '//*[@id="disable-breathe-learn-modal"]/div/div/div[2]/input').click
    sleep 1
    driver.find_element(xpath: '//*[@id="edit_account_3899"]/input[4]').click
    sleep 1
    # Rota, Time & Attendance
    driver.find_element(id: 'account_use_rta_0').click
    sleep 1
    driver.find_element(xpath: '//*[@id="delete-rta-modal"]/div/div/div[2]/input').click
    sleep 1
    driver.find_element(xpath: '//*[@id="edit_account_3899"]/input[5]').click
    sleep 1
  end

  def modules_free_switch_on_off
    # on
    # burnout behind featire flag
    driver.find_element(id: 'account_use_burnout_indicators').click
    driver.find_element(id: 'account_use_company_suggestions').click
    driver.find_element(id: 'account_use_covid_result').click
    driver.find_element(id: 'account_use_dbs').click
    driver.find_element(id: 'account_use_contacts').click # emergency contacts
    driver.find_element(id: 'account_use_employee_nps').click
    driver.find_element(id: 'account_use_edi').click
    driver.find_element(id: 'account_use_assets').click # equipment
    driver.find_element(id: 'account_use_grievances').click
    driver.find_element(id: 'account_use_id_documents').click
    driver.find_element(id: 'account_use_kudos').click
    driver.find_element(id: 'account_use_location_records').click
    driver.find_element(id: 'account_use_medical_facts').click
    driver.find_element(id: 'account_use_notes').click
    driver.find_element(id: 'account_use_org_chart').click
    driver.find_element(id: 'account_use_payslip_imports').click
    sleep 0.25
    driver.find_element(css: '#edit_account_3899 > p > input').click
    sleep 0.5
    # off
    driver.find_element(id: 'account_use_burnout_indicators').click
    driver.find_element(id: 'account_use_company_suggestions').click
    driver.find_element(id: 'account_use_covid_result').click
    driver.find_element(id: 'account_use_dbs').click
    driver.find_element(id: 'account_use_contacts').click
    driver.find_element(id: 'account_use_employee_nps').click
    driver.find_element(id: 'account_use_edi').click
    driver.find_element(id: 'account_use_assets').click
    driver.find_element(id: 'account_use_grievances').click
    driver.find_element(id: 'account_use_id_documents').click
    driver.find_element(id: 'account_use_kudos').click
    driver.find_element(id: 'account_use_location_records').click
    driver.find_element(id: 'account_use_medical_facts').click
    driver.find_element(id: 'account_use_notes').click
    driver.find_element(id: 'account_use_org_chart').click
    driver.find_element(id: 'account_use_payslip_imports').click
    sleep 0.25
    driver.find_element(css: '#edit_account_3899 > p > input').click
    sleep 0.5
    # scroll page
    element = driver.find_element(id: 'account_log_employee_changes')
    driver.execute_script('arguments[0].scrollIntoView(true);', element)
    sleep 0.5
    # payslip import links
    driver.find_element(xpath: '//*[@id="edit_account_3899"]/div/div[1]/div/div[19]/a/small').click
    sleep 1
    driver.navigate.back
    sleep 1
    # scroll page
    element = driver.find_element(id: 'account_custom_field_5_label')
    driver.execute_script('arguments[0].scrollIntoView(true);', element)
    sleep 0.5
    # data link on personal change logs
    driver.find_element(xpath: '//*[@id="edit_account_3899"]/div/div[2]/div[3]/div[2]/div[1]/a').click
    sleep 1
    driver.navigate.back
    sleep 1
    # on
    driver.find_element(id: 'account_use_personal_history').click
    driver.find_element(id: 'account_use_time_logs').click
    driver.find_element(id: 'account_use_training').click
    driver.find_element(css: '#edit_account_3899 > p > input').click
    sleep 1
    # off
    driver.find_element(id: 'account_use_personal_history').click
    driver.find_element(id: 'account_use_time_logs').click
    driver.find_element(id: 'account_use_training').click
    driver.find_element(css: '#edit_account_3899 > p > input').click
    # driver.find_element(id: 'account_location_booking_enabled').click
    # driver.find_element(css: '#edit_account_3899 > p > input').click
    # sleep 0.50
  end

  def custom_fields
    # has to be at least a regular plan type
    driver.find_element(id: 'account_use_custom_fields').click
    sleep 1
    driver.find_element(id: 'account_use_custom_fields').click
    sleep 1
    driver.find_element(id: 'account_custom_field_1_label').clear
    driver.find_element(id: 'account_custom_field_1_label').send_keys("Computer Equipment #{todays_date_string}")
    driver.find_element(css: '#edit_account_3899 > p > input').click
  end

  def payroll_export_log_changes_only_on
    driver.find_element(id: 'account_use_payroll_export_changes').click
    driver.find_element(css: '#edit_account_3899 > p > input').click
  end

  def payroll_export_log_off
    driver.find_element(id: 'account_use_payroll_export_none').click
    driver.find_element(css: '#edit_account_3899 > p > input').click
  end

  def person_change_logs
    driver.find_element(id: 'account_log_employee_changes').click
    driver.find_element(css: '#edit_account_3899 > p > input').click
  end

  def onboarding_tasks_on
    driver.find_element(id: 'account_use_onboarding_1').click
    driver.find_element(css: '#edit_account_3899 > p > input').click
  end

  def onboarding_tasks_off
    driver.find_element(id: 'account_use_onboarding_0').click
    driver.find_element(css: '#edit_account_3899 > p > input').click
  end

  def xero_payroll_integration_on
    driver.find_element(id: 'account_use_xero_payroll_1').click
    driver.find_element(css: '#edit_account_3899 > p > input').click
    sleep 1
  end

  def xero_payroll_integration_off
    driver.find_element(id: 'account_use_xero_payroll_0').click
    sleep 0.50
    driver.find_element(xpath: '//*[@id="disable-breathe-xero-payroll-modal"]/div/div/div[2]/input').click
    sleep 0.50
    driver.find_element(xpath: '//*[@id="edit_account_3899"]/input[4]').click
    sleep 1
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/ClassLength
