# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class PicklistGenderExtension < Base
  # gender
  # rubocop:disable Metrics/AbcSize
  def navigate_to_gender
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div[1]/div[3]/a[2]').click
  end

  def details_genders_add
    driver.find_element(xpath: '/html/body/section[2]/div[2]/a').click
    driver.find_element(id: 'gender_name').send_keys 'Other'
    driver.find_element(xpath: '//*[@id="new_gender"]/p/input').click
  end

  def details_genders_edit
    a = driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(3) > td.actions > a:nth-child(1)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[4]
    selector = "#edit_gender_#{split_value} > p > input"
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[3]/td[2]/a[1]').click
    driver.find_element(id: 'gender_name').clear
    driver.find_element(id: 'gender_name').send_keys 'Other Edit'
    driver.find_element(css: selector).click
  end

  def delete_gender
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(3) > td.actions > svg').click
    a = driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(3) > td.actions > a:nth-child(3)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[4]
    selector = "#delete_gender_#{split_value} > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm"
    driver.find_element(css: selector).click
  end

  def details_genders_return_breadcrumb
    driver.find_element(css: 'body > section.content.container.p-4 > div.breadcrumb.mb-2 > a').click
  end
  # rubocop:enable Metrics/AbcSize
end
