# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)
class CompanyBlackoutsExtension < Base
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def company_blakout_add_new
    driver.find_element(css: 'body > section.content.container.p-4 > div.float-right > a').click
    driver.find_element(id: 'company_blackout_name').send_keys "Blackout test #{todays_date}"
    driver.find_element(id: '#company_blackout_start_date_react').send_keys todays_date + 14
    driver.find_element(id: '#company_blackout_end_date_react').send_keys todays_date + 14
    driver.find_element(id: 'company_blackout_whole_company').click
    driver.find_element(xpath: '//*[@id="new_company_blackout"]/p/input').click
    driver.find_element(xpath: '/html/body/section[2]/div[1]/a').click
  end

  def company_blackout_edit
    a = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(1)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[4]
    selector = "#edit_company_blackout_#{split_value} > p > input"
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(1)').click
    driver.find_element(id: 'company_blackout_name').clear
    driver.find_element(id: 'company_blackout_name').send_keys 'Edited Blackout test'
    driver.find_element(id: '#company_blackout_start_date_react').clear
    driver.find_element(id: '#company_blackout_start_date_react').send_keys todays_date + 16
    driver.find_element(id: '#company_blackout_end_date_react').clear
    driver.find_element(id: '#company_blackout_end_date_react').send_keys todays_date + 16
    # driver.find_element(id: 'company_blackout_whole_company').click
    driver.find_element(css: selector).click
  end

  def company_blackout_delete
    a = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > svg')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[4]
    selector = "#delete_company_blackout_#{split_value} > div > div >
                div.modal-footer > button.btn.btn-danger.modal-confirm"
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > svg').click
    driver.find_element(css: selector).click
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
end
