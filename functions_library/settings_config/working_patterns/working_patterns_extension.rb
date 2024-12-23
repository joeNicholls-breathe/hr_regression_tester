# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class AccountWorkingPatternExtension < Base
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def working_pattern_add
    driver.find_element(xpath: '/html/body/div[3]/div/section/div[2]/a').click
    driver.find_element(id: 'working_pattern_name').send_keys 'Reggression Add Working Pattern'
    driver.find_element(id: 'working_pattern_mon_hr_hours').send_keys '7'
    driver.find_element(id: 'working_pattern_mon_hr_minutes').send_keys '30'
    driver.find_element(id: 'working_pattern_tue_hr_hours').send_keys '7'
    driver.find_element(id: 'working_pattern_tue_hr_minutes').send_keys '30'
    driver.find_element(id: 'working_pattern_wed_hr_hours').send_keys '7'
    driver.find_element(id: 'working_pattern_wed_hr_minutes').send_keys '30'
    driver.find_element(id: 'working_pattern_thu_hr_hours').send_keys '7'
    driver.find_element(id: 'working_pattern_thu_hr_minutes').send_keys '30'
    driver.find_element(id: 'working_pattern_fri_hr_hours').send_keys '7'
    driver.find_element(id: 'working_pattern_fri_hr_minutes').send_keys '30'
    driver.find_element(id: 'working_pattern_sat_hr_hours').send_keys '7'
    driver.find_element(id: 'working_pattern_sat_hr_minutes').send_keys '30'
    driver.find_element(id: 'working_pattern_sun_hr_hours').send_keys '7'
    driver.find_element(id: 'working_pattern_sun_hr_minutes').send_keys '30'
    driver.find_element(xpath: '//*[@id="new_working_pattern"]/p/input').click
  end

  def working_pattern_breadcrumb
    driver.find_element(xpath: '/html/body/div[4]/div/section/div[1]/a').click
  end

  def working_pattern_set_new_default
    drop = driver.find_element(id: 'account_working_pattern_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, '3936')
    driver.find_element(xpath: '/html/body/div[3]/div/section/form[2]/div/div[2]/input').click
  end

  def working_pattern_edit
    a = driver.find_element(css: '#DataTables_Table_0 > tbody > tr.even > td.actions > a:nth-child(1)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[4]
    selector = "#edit_working_pattern_#{split_value} > p > input"
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[2]/td[5]/a[1]').click
    driver.find_element(id: 'working_pattern_name').clear
    driver.find_element(id: 'working_pattern_name').send_keys "Edited on #{todays_date_string}"
    driver.find_element(id: 'working_pattern_sun_hr_hours').clear
    driver.find_element(id: 'working_pattern_sun_hr_hours').send_keys '10'
    driver.find_element(css: selector).click
  end

  def working_pattern_delete
    a = driver.find_element(css: '#DataTables_Table_0 > tbody > tr.even > td.actions > a:nth-child(4)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[4]
    selector = "#delete_pattern_#{split_value} > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm"
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr.even > td.actions > svg').click
    driver.find_element(css: selector).click
  end

  def working_pattern_search
    driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').send_keys 'Z'
    sleep 1
  end

  def working_pattern_show_inactive
    driver.find_element(id: 'show-inactive-patterns').click
    driver.find_element(xpath: '/html/body/div[4]/div/section/form[1]/div/div/div[3]/input').click
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
end
