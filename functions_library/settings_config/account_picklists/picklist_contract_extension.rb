# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class PicklistContactExtension < Base
  # contract type
  def details_navigate_to_contract_type
    driver.find_element(xpath: '/html/body/div[3]/div/section/div[3]/div[1]/div[3]/a[1]').click
  end

  def details_contract_types_add
    driver.find_element(xpath: '/html/body/div[3]/div/section/div[2]/a').click
    driver.find_element(id: 'company_contract_type_name').send_keys("Add Contract Type#{todays_date_string}")
    driver.find_element(css: '#new_company_contract_type > p > input').click
  end

  def details_contract_types_add_cancel
    driver.find_element(xpath: '/html/body/div[4]/div/section/div[2]/a').click
    driver.find_element(id: 'company_contract_type_name').send_keys 'Add Contract Type Cancel'
    driver.find_element(xpath: '//*[@id="new_company_contract_type"]/p/a').click
  end

  def details_contract_type_add_return_breadcrumb
    driver.find_element(xpath: '/html/body/div[4]/div/section/div[1]/a').click
  end

  def details_contract_types_edit
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[2]/a[1]').click
    driver.find_element(id: 'company_contract_type_name').clear
    driver.find_element(id: 'company_contract_type_name').send_keys 'Contract Type Edit'
    driver.find_element(xpath: '//*/p/input').click
  end

  def details_contract_types_edit_cancel
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[2]/a[1]').click
    driver.find_element(id: 'company_contract_type_name').clear
    driver.find_element(id: 'company_contract_type_name').send_keys 'Contract Type Edit Cancel'
    driver.find_element(xpath: '//*/p/a').click
  end

  def details_contract_types_delete
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr.even > td.actions > svg').click
    a = driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(2) > td.actions > a:nth-child(3)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[4]
    # puts "value: #{split_value}"
    selector =
      "#delete_contract_type_#{split_value} > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm"
    driver.find_element(css: selector).click
  end

  def details_contract_types_delete_cancel
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr.even > td.actions > svg').click
    # this id number should not change as it should not be deleted ever.
    sleep 0.5
    driver.find_element(
      css: '#delete_contract_type_13270 > div > div > div.modal-footer > button.btn.btn-secondary'
    ).click
  end
end
