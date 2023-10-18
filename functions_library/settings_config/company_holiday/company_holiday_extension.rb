# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class CompanyHolidaysExtension < Base
  def company_holiday_add
    driver.find_element(css: 'body > section.content.container.p-4 > div.float-right > a').click
    driver.find_element(id: 'company_holiday_name').send_keys "Test Holiday #{todays_date}"
    driver.find_element(id: '#company_holiday_day_on_react').send_keys todays_date
    driver.find_element(id: 'company_holiday_half').click
    driver.find_element(xpath: '//*[@id="new_company_holiday"]/p/input').click
  end

  def company_holiday_edit
    a = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(1)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[4]
    selector = "#edit_company_holiday_#{split_value} > p > input"
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(1)').click
    driver.find_element(id: 'company_holiday_name').clear
    driver.find_element(id: 'company_holiday_name').send_keys "Edited Company Test Holiday #{todays_date}"
    driver.find_element(id: '#company_holiday_day_on_react').clear
    driver.find_element(id: '#company_holiday_day_on_react').send_keys one_month
    driver.find_element(id: 'company_holiday_half').click
    driver.find_element(css: selector).click
  end

  def company_holiday_delete
    a = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(1)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[4]
    selector = "#delete_company_holiday_#{split_value}> div > div >
                div.modal-footer > button.btn.btn-danger.modal-confirm"
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > svg').click
    driver.find_element(css: selector).click
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
