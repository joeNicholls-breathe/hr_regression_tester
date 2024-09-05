# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/ClassLength
class AppNavigationExtensionFinance < Base
  def finance_people_list
    driver.navigate.to('https://hr.breathehrstaging.com/employees')
  end

  def filter_people_list_employees_only
    driver.find_element(id: 'only-Employee-employees').click
    driver.find_element(css: '.btn-primary').click
  end

  def bulk_assign_pension_all_employees
    driver.find_element(id: 'select-all').click
    sleep 0.1
    element = driver.find_element(id: 'bulk-task-selector')
    driver.execute_script('arguments[0].scrollIntoView(true);', element)
    sleep 0.1
    drop = driver.find_element(id: 'bulk-task-selector')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Assign benefit / pension records')
    sleep 0.10
    driver.find_element(css: '#bulk-task-go').click
    sleep 0.50
    driver.find_element(css: '#benefit-update').click
    sleep 1
    drop = driver.find_element(id: 'employee_benefit_company_benefit_type_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, '11522')
    driver.find_element(id: 'employee_benefit_provider').send_keys 'Royal London GPP'
    driver.find_element(id: '#employee_benefit_start_date_react').send_keys todays_date_string
    driver.find_element(id: '#employee_benefit_end_date_react').send_keys one_year_date_string
    driver.find_element(id: '#employee_benefit_review_date_react').send_keys five_year_date_string
    drop = driver.find_element(id: 'employee_benefit_remuneration_currency_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, '1')
    driver.find_element(id: 'employee_benefit_employer_contribution').clear
    driver.find_element(id: 'employee_benefit_employer_contribution').send_keys '5.0'
    driver.find_element(id: 'employee_benefit_employee_contribution').clear
    driver.find_element(id: 'employee_benefit_employee_contribution').send_keys '3.0'
    drop = driver.find_element(id: 'employee_benefit_frequency')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, 'Monthly')
    drop = driver.find_element(id: 'employee_benefit_amount_type')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, 'Percentage (%)')
    driver.find_element(id: 'employee_benefit_note').send_keys
    driver.find_element(css: 'input.btn').click
  end

  def bulk_assign_people_type_contractor
    driver.find_element(css: 'tr.odd:nth-child(7) > td:nth-child(10)').click
    driver.find_element(css: 'tr.odd:nth-child(8) > td:nth-child(10)').click
    drop = driver.find_element(id: 'bulk-task-selector')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:id, 'assign-person-type')
    driver.find_element(css: '#bulk-task-go').click
    sleep 0.5
    driver.find_element(css: '#benefit-update').click
    sleep 0.50
    drop = driver.find_element(id: 'person_type')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, 'Contractor')
    driver.find_element(css: 'div.modal-footer:nth-child(5) > input:nth-child(2)').click
  end

  def finance_change_plan
    driver.navigate.to('https://hr.breathehrstaging.com/account/plan#monthly')
    driver.find_element(css: 'li.nav-item:nth-child(2) > a:nth-child(1)').click
    driver.find_element(css: '#annual > div > div:nth-child(3) > div > div.plan-select > input').click
    driver.find_element(css: '#submit-modal-button').click
    sleep 0.50
    driver.find_element(css: '#plan_change_modal > div > div >
      div.modal-footer > button.modal-confirm.btn.btn-success').click
  end

  def finance_return_to_previous_plan
    driver.navigate.to('https://hr.breathehrstaging.com/account/plan#monthly')
    driver.find_element(css: '#monthly > div > div:nth-child(5) > div > div.plan-select > input').click
    driver.find_element(css: '#submit-modal-button').click
    sleep 0.50
    driver.find_element(css: '#plan_change_modal > div > div >
      div.modal-footer > button.modal-confirm.btn.btn-success').click
  end

  def update_billing_details
    driver.navigate.to('https://hr.breathehrstaging.com/account/billing')
    sleep 0.50
    driver.find_element(css: 'body > section.content.container > div.row > div:nth-child(1)
      > div > table > tbody > tr:nth-child(1) > td:nth-child(3) > a').click
    sleep 0.50
    driver.find_element(id: 'account_payment_contact_name').send_keys 'Finance User'
    driver.find_element(id: 'account_payment_contact_email').send_keys 'finance@auto-reg.com'
    driver.find_element(id: 'account_payment_contact_phone').send_keys '0208 654 2008'
    driver.switch_to.frame(driver.find_element(css: '#card-element iframe'))
    driver.find_element(xpath: '//*[@id="root"]/form/div/div[2]/span[1]/span[2]/div/div[2]/span/input')
          .send_keys '4242424242424242'
    driver.find_element(xpath: '//*[@id="root"]/form/div/div[2]/span[2]/span[1]/span/span/input').send_keys '09/28'
    driver.find_element(xpath: '//*[@id="root"]/form/div/div[2]/span[2]/span[2]/span/span/input').send_keys '123'
    driver.find_element(xpath: '//*[@id="root"]/form/div/div[2]/span[2]/span[3]/span/span/input').send_keys '90210'
    driver.switch_to.default_content
    driver.find_element(xpath: '//*[@id="card-button"]').click
    sleep 0.50
  end

  def check_billing_history
    driver.navigate.to('https://hr.breathehrstaging.com/account/history')
  end

  def finance_user_report_check
    driver.navigate.to('https://hr.breathehrstaging.com/workers_reports')
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/ClassLength
