# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

# rubocop:disable Metrics/AbcSize
class AppNavigationExtensionLM < Base
  def lm_dashboard
    driver.find_element(css: '#tab-hr-dashboard-link > span:nth-child(1)').click
  end

  def my_people
    driver.find_element(xpath: '/html/body/section[1]/div/nav/div/ul/li[6]').click
    driver.find_element(xpath: '/html/body/section[1]/div/nav/div/ul/li[6]/div/a[2]').click
  end

  def my_employee
    driver.find_element(xpath: '/html/body/section[2]/div/table/tbody/tr/td[9]/a').click
  end

  def my_employee_leave
    driver.find_element(xpath: '/html/body/section[2]/div[1]/div[7]/ul/li[2]').click
  end

  def view_leave_record
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a > svg').click
  end

  def approve_employee_leave_request
    a = driver.find_element(class: 'edit_leave_request')
    attribute_value = a.attribute('id')
    split_value = attribute_value.split('_')[3]
    selector = "#edit_leave_request_#{split_value} > div.modal-footer > input"
    driver.find_element(xpath: '/html/body/section[2]/div[4]/div[2]/button[2]').click
    driver.find_element(css: selector).click
  end

  def return_to_employee_leave
    driver.find_element(xpath: '/html/body/section[2]/div[2]/a').click
  end

  def add_leave_for_my_employee
    driver.find_element(xpath: '/html/body/section[2]/div[2]/div/a').click
  end

  def cancel_employee_leave_request
    driver.find_element(xpath: '//*[@id="tabs-0"]/li[2]/a').click # move to booked (if needed)
    driver.find_element(css: '#DataTables_Table_1 > tbody > tr.even > td.actions > a:nth-child(2) > svg').click
    driver.find_element(xpath: '//*[@id="leave_request_cancellation_reason"]')
          .send_keys('Cancel Employee leave request')
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def return_to_employee_leave_index
    driver.find_element(xpath: '/html/body/section[2]/div[2]/a').click
  end

  def add_toil
    driver.find_element(id: 'toil').click
    sleep 0.25
    # driver.find_element(css: '#employee_holiday_year_adjustment_adjustment_hours').send_keys '1'
    # driver.find_element(css: '#employee_holiday_year_adjustment_adjustment_minutes').send_keys '30'
    driver.find_element(id: 'employee_holiday_year_adjustment_adjustment').send_keys '1'
    driver.find_element(id: '#employee_holiday_year_adjustment_earned_from_date_react').send_keys one_week_ago_string
    driver.find_element(id: '#employee_holiday_year_adjustment_earned_to_date_react').send_keysb one_week_ago_string
    driver.find_element(id: 'employee_holiday_year_adjustment_reason').send_keys one_week_ago_string
    driver.find_element(css: '#new_employee_holiday_year_adjustment > div.modal-footer > input').click
  end

  def add_adjustment_additional
    driver.find_element(id: 'increase').click
    driver.find_element(id: 'employee_holiday_year_adjustment_adjustment').send_keys '1'
    driver.find_element(id: 'employee_holiday_year_adjustment_reason').send_keys one_week_ago_string
    driver.find_element(css: '#new_employee_holiday_year_adjustment > div.modal-footer > input').click
  end

  def subtract_ajustment_subtrack
    driver.find_element(id: 'decrease').click
    driver.find_element(id: 'employee_holiday_year_adjustment_adjustment').send_keys
    driver.find_element(id: 'employee_holiday_year_adjustment_reason').click
    driver.find_element(css: '#new_employee_holiday_year_adjustment > div.modal-footer > input').click
  end

  def return_to_dashboard
    driver.find_element(css: '#wrapper > div > p:nth-child(3) > a').click
    sleep 0.25
  end

  def create_a_sickness
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/sicknesses')
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/a[2]/span/svg[2]').click
  end

  def navigate_to_sickness
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/sicknesses')
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr/td[7]/a').click
    a = driver.find_element(css: 'body > section.content.container.p-4 > div.employee-section-header > div > a:nth-child(1)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[4]
    selector = "#edit_sickness_#{split_value} > p > input"
    driver.find_element(id: 'complete-sickness').click
    driver.find_element(css: selector).click
  end

  def navigate_to_learn
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/learn/courses')
    driver.find_element(xpath: '//*[@id="learn"]/span').click
  end

  def navigate_to_performance
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/performance')
    driver.find_element(xpath: '//*[@id="one-to-ones"]/div/a').click
  end

  def navigate_to_documents
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/documents')
    driver.find_element(xpath: '//*[@id="tab-my-documents"]/div/a').click
  end

  def navigate_to_jobs
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/jobs')
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr/td[7]/a[2]').click
  end

  def navigate_to_remuneration
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/pay_and_benefits')
    driver.find_element(xpath: '//*[@id="tab-pay"]/div/a').click
  end
  # rubocop:enable Metrics/AbcSize
end
