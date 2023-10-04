# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class AccountPicklistExpensesExtension < Base
  # expense types
  def pay_and_benefits_expense_types_new
    driver.find_element(css: 'href="/company_expense_types"').click
    driver.find_element(css: 'href="/company_expense_types/new"').click
    driver.find_element(id: 'company_expense_type_name').sendkeys 'Regression Test NEW DATE TODAY'
    driver.find_element(id: 'company_expense_type_code').sendkeys 'Regression Test NEW DATE TODAY'
    driver.find_element(xpath: '//*[@id="new_company_expense_type"]/p/input').click
  end

  def pay_and_benefits_expense_types_edit
    driver.find_element(css: 'href="/company_expense_types"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a > svg').click
    driver.find_element(id: 'company_expense_type_name').sendkeys 'Regression Test EDIT DATE TODAY'
    driver.find_element(id: 'company_expense_type_code').sendkeys 'Regression Test EDIT DATE TODAY'
    driver.find_element(xpath: '//*[@id="new_company_expense_type"]/p/input').click
  end

  def pay_and_benefits_expense_types_cancel_new
    driver.find_element(css: 'href="/company_expense_types"').click
    driver.find_element(css: 'href="/company_expense_types/new"').click
    driver.find_element(id: 'company_expense_type_name').sendkeys 'Regression Test CANCEL NEW DATE TODAY'
    driver.find_element(id: 'company_expense_type_code').sendkeys 'Regression Test CANCEL NEW DATE TODAY'
    driver.find_element(css: 'href="/company_expense_types"').click
  end

  def pay_and_benefits_expense_types_delete
    driver.find_element(css: 'href="/company_expense_types"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(6) > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="company_expense_type"]/div/div/div[3]/button[2]').click
  end

  def pay_and_benefits_expense_types_search
    driver.find_element(css: 'href="/company_expense_types"').click
    driver.find_element(id: 'company_expense_type_name').sendkeys ''
    sleep 1
  end

  def pay_and_benefits_expense_types_breadcrumb
    driver.find_element(css: 'href="/company_expense_types"').click
    driver.find_element(css: 'href="/company_expense_types/new"').click
    driver.find_element(css: 'href="/company_expense_types"').click
  end

  # mileage rates
  def pay_and_benefits_mileage_rates_new
    driver.find_element(css: 'href="/company_mileage_rates"').click
    driver.find_element(css: 'href="/company_mileage_rates/new"').click
    driver.find_element(id: 'company_mileage_rate_rate').sendkeys '0.85' # rate is current by default
    driver.find_element(xpath: '//*[@id="new_company_mileage_rate"]/p/input').click
  end

  def pay_and_benefits_mileage_rates_edit
    driver.find_element(css: 'href="/company_mileage_rates"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr.odd > td.actions > a:nth-child(1) > svg').click
    driver.find_element(id: 'company_mileage_rate_rate').sendkeys '1.30' # rate is current by default
    driver.find_element(xpath: '//*[@id="new_company_mileage_rate"]/p/input').click
  end

  def pay_and_benefits_mileage_rates_cancel_new
    driver.find_element(css: 'href="/company_mileage_rates"').click
    driver.find_element(css: 'href="/company_mileage_rates/new"').click
    driver.find_element(id: 'company_mileage_rate_rate').sendkeys '101.11' # rate is current by default
    driver.find_element(css: 'href="/company_mileage_rates"').click
  end

  def pay_and_benefits_mileage_rates_delete
    driver.find_element(css: 'href="/company_mileage_rates"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr.odd > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="company_mileage_rate"]/div/div/div[3]/button[2]').click
  end

  def pay_and_benefits_mileage_rates_search
    driver.find_element(css: 'href="/company_mileage_rates"').click
    driver.find_element(css: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys
    sleep 1
  end

  def pay_and_benefits_mileage_rates_breadcrumb
    driver.find_element(css: 'href="/company_mileage_rates"').click
    driver.find_element(css: 'href="/company_mileage_rates/new"').click
    driver.find_element(css: 'href="/company_mileage_rates"').click
  end
end
