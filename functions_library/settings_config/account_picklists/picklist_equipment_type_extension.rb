# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class PicklistEquipmentExtension < Base
  # equipment type
  def details_equipment_types_add
    driver.find_element(css: 'href="/company_asset_types"').click
    driver.find_element(xpath: '/html/body/section[2]/div[2]/a/span/svg[2]').click
    driver.find_element(id: 'company_asset_type_name').send_keys 'Equipment test add'
    driver.find_element(id: 'company_asset_type_current').click
  end

  def details_equipment_types_edit
    driver.find_element(css: 'href="/company_asset_types"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[3]/a[1]').click
    driver.find_element(id: 'company_asset_type_name').send_keys 'Equipment test Edit'
    driver.find_element(id: 'company_asset_type_current').click
  end

  def details_equipment_types_delete
    driver.find_element(css: '').click
    a = driver.find_element(css: '')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[4]
    selector = split_value.to_s
    driver.find_element(css: selector).click
  end

  def details_equipment_types_return_breadscrumb
    driver.find_element(css: 'href="/company_asset_types"').click
    driver.find_element(css: 'href="/account/picklists"').click
  end
end
