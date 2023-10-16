# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/ClassLength
class AccountModulesExtension < Base
  def modules_chargable_switch_on
    # Expenses
    driver.find_element(id: 'account_use_expenses_1').click
    # Recruitment - std
    driver.find_element(id: 'account_recruitment_standard').click
    # Learn
    driver.find_element(id: 'account_use_learn_1').click
    # Rota, Time & Attendance
    driver.find_element(id: 'account_use_rta_1').click
    sleep 0.25
    driver.find_element(css: '#enable-rta-modal .modal-confirm').click
    driver.find_element(id: 'update-chargeable-modules-btn').click
  end

  def modules_free_switch_on_off
    # on
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
    element = driver.find_element(id: 'account_use_payslip_imports')
    driver.execute_script('arguments[0].scrollIntoView(true);', element)
    sleep 1.5
    driver.find_element(xpath: '//*/div/div[1]/div/div[16]/a').click
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
