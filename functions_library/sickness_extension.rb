# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class SicknessExtension < Base
  def sickness_status
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td:nth-child(2)').text
  end

  def holiday_employee_sickness_index
    driver.navigate.to('https://hr.breathehrstaging.com/employees/20717/sicknesses')
  end

  def create_sickness_data_holiday_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/20717/sicknesses/new')
  end

  def employee_sickness_create
    driver.find_element(css: '#\#sickness_start_date_react').send_keys two_week_date_string
    driver.find_element(css: '#\#sickness_end_date_react').send_keys two_week_date_string
    sleep 1
    drop = driver.find_element(id: 'sickness_company_sicknesstype_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Other')
    driver.find_element(xpath: '//*[@id="new_sickness"]/p/input').click
  end

  def employee_create_open_sickness
    driver.find_element(css: '#\#sickness_start_date_react').send_keys two_week_date_string
    sleep 1
    drop = driver.find_element(id: 'sickness_company_sicknesstype_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Other')
    driver.find_element(xpath: '//*[@id="new_sickness"]/p/input').click
  end

  def employee_sickness_two_create
    driver.find_element(css: '#\#sickness_start_date_react').send_keys one_month_date_string
    driver.find_element(css: '#\#sickness_end_date_react').send_keys one_month_date_string
    sleep 1
    drop = driver.find_element(id: 'sickness_company_sicknesstype_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Other')
    driver.find_element(xpath: '//*[@id="new_sickness"]/p/input').click
  end

  def employee_create_open_sickness_two
    driver.find_element(css: '#\#sickness_start_date_react').send_keys one_month_date_string
    sleep 1
    drop = driver.find_element(id: 'sickness_company_sicknesstype_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Other')
    driver.find_element(xpath: '//*[@id="new_sickness"]/p/input').click
  end

  def edit_sickness_record
    a = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(1)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[6]
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a > svg').click
    selector = "#edit_sickness_#{split_value} > p > input"
    driver.find_element(css: selector).click
  end

  def delete_sickness_record
    a = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(2)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[6]
    selector = "#delete_sickness_#{split_value} > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm"
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > svg').click
    driver.find_element(css: selector).click
  end

  def sickness_request_for_last_monday
    driver.find_element(css: '#\#sickness_start_date_react').send_keys last_monday
    driver.find_element(css: '#\#sickness_end_date_react').send_keys last_monday
    sleep 1
    drop = driver.find_element(id: 'sickness_company_sicknesstype_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Other')
    driver.find_element(xpath: '//*[@id="new_sickness"]/p/input').click
  end

  def new_edit_sickness
    first_row = driver.find_element(class: 'odd')
    actions = first_row.find_elements(class: 'actions')
    row_actions = actions[0].find_elements(tag_name: 'A')
    edit = row_actions.find { |x| x.include? 'edit' }
    edit.click
  end

  def click_sickness_breadcrumb
    driver.find_element(css: 'body > div.hr-main-container > div.hr-main > section > div.breadcrumb > a').click
  end

  def click_sickness_form_breadcrumb
    driver.find_element(css: 'body > div.hr-main-container > div.hr-main > section > div > div > div > a').click
  end

  def open_sickness_form
    driver.find_element(
      css: 'body > div.hr-main-container > div.hr-main > section > div.employee-section-header > div > a:nth-child(2) > span > svg.svg-inline--fa.fa-plus.fa-w-14.fa-inverse.fa-stack-1x' # rubocop:disable Layout/LineLength
    ).click
  end

  def manager_closing_sickness(sickness_id)
    radio = driver.find_element(class: 'radio')
    radio.find_element(id: 'complete-sickness').click
    driver.find_element(id: '#sickness_end_date_react').send_keys two_week_date_string
    driver.find_element(css: "#edit_sickness_#{sickness_id} > p > input").click
  end

  def manager_raising_query(sickness_id)
    driver.find_element(id: 'reject-sickness').click
    driver.find_element(id: 'sickness_review_notes').send_keys 'Regression Test'
    driver.find_element(css: "#edit_sickness_#{sickness_id} > p > input").click
  end
end
