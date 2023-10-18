# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class AccountHolidayAllowanceExtension < Base
  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def holiday_allowances_add
    driver.find_element(css: 'body > section.content.container.p-4 > div.float-right > a').click
    driver.find_element(id: 'holiday_allowance_title')
          .send_keys "Regression Test holiday allowance#{todays_date_string}"
    driver.find_element(id: 'holiday_allowance_flat_quantity').send_keys '25'
    driver.find_element(id: 'holiday_allowance_carryover_true').click
    driver.find_element(id: 'holiday_allowance_max_use_by_end').send_keys '5'
    driver.find_element(id: 'holiday_allowance_months_range_from_end').send_keys '3'
    driver.find_element(id: 'holiday_allowance_allow_negative_true').click
    driver.find_element(id: 'holiday_allowance_max_negative').send_keys '5'
    driver.find_element(xpath: '//*[@id="new_holiday_allowance"]/p/input').click
    sleep 0.5
    driver.find_element(css: 'body > section.content.container.p-4 > div.breadcrumb > a').click
  end

  def holiday_allowances_edit
    a = driver.find_element(css: '#DataTables_Table_0 > tbody > tr.even > td.actions > a:nth-child(1)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[4]
    selector = "#edit_holiday_allowance_#{split_value} > p > input"
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr.even > td.actions > a:nth-child(1)').click
    driver.find_element(id: 'holiday_allowance_title').clear
    driver.find_element(id: 'holiday_allowance_title').send_keys "Editted - holiday allowance#{todays_date_string}"
    driver.find_element(id: 'holiday_allowance_flat_quantity').clear
    driver.find_element(id: 'holiday_allowance_flat_quantity').send_keys '21'
    driver.find_element(css: selector).click
    driver.find_element(css: 'body > section.content.container.p-4 > div.breadcrumb > a').click
  end

  def holiday_allowances_select_default
    drop = driver.find_element(id: 'account_holiday_allowance_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, '3974')
    driver.find_element(xpath: '/html/body/section[2]/form[2]/div/div[2]/input').click
    driver.find_element(css: 'body > section.content.container.p-4 > div.breadcrumb > a').click
  end

  def holiday_allowances_delete
    a = driver.find_element(css: '#DataTables_Table_0 > tbody > tr.even > td.actions > a:nth-child(2)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[4]
    selector = "#delete_allowance_#{split_value} > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm"
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr.even > td.actions > svg').click
    driver.find_element(css: selector).click
  end

  def holiday_allowance_show_inactive
    driver.find_element(
      css: 'body > section.content.container.p-4 > form:nth-child(5) >
            div > div > div.row.m-0 > div > div > div > input'
    ).click
    driver.find_element(
      css: 'body > section.content.container.p-4 > form:nth-child(5) > div > div > div.form-group.buttons > input'
    ).click
  end

  def holiday_allowance_search
    driver.find_element(css: '#DataTables_Table_0_filter > label > input').send_keys 'Z'
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
end
