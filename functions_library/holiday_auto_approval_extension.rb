# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)
class HolidayAutoApprovalExtension < Base
  def auto_approval_employee_one_holiday_index
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24556/holidays')
  end

  def auto_approval_employee_two_holiday_index
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24557/holidays')
  end

  def auto_approval_employee_three_holiday_index
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24558/holidays')
  end

  def auto_approval_off_employee_holiday_index
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24559/holidays')
  end

  def auto_approval_employee_one_new_leave_request
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24556/leave_requests/new')
  end

  def auto_approval_employee_two_new_leave_request
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24557/leave_requests/new')
  end

  def auto_approval_employee_three_new_leave_request
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24558/leave_requests/new')
  end

  def auto_approval_off_employee_new_leave_request
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24559/leave_requests/new')
  end

  def holiday_request_for_auto_approval
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys '16/12/2025'
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys '16/12/2025'
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def purge_holiday_data_auto_approval_employee_one
    driver.navigate.to('https://hr.breathehrstaging.com/account/purge_data')
    drop = driver.find_element(:id, 'employee_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'auto approval-one')
    driver.find_element(xpath: '/html/body/section[2]/div/div[3]/div/form/div/div[3]/input').click
    driver.find_element(id: 'continue-purge').click
    driver.find_element(xpath: '//*[@id="purge_data_modal"]/div/div/div[3]/button[2]').click
  end

  def purge_holiday_data_auto_approval_employee_two
    driver.navigate.to('https://hr.breathehrstaging.com/account/purge_data')
    drop = driver.find_element(:id, 'employee_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'auto approved-two')
    driver.find_element(xpath: '/html/body/section[2]/div/div[3]/div/form/div/div[3]/input').click
    driver.find_element(id: 'continue-purge').click
    driver.find_element(xpath: '//*[@id="purge_data_modal"]/div/div/div[3]/button[2]').click
  end

  def purge_holiday_data_auto_approval_employee_three
    driver.navigate.to('https://hr.breathehrstaging.com/account/purge_data')
    drop = driver.find_element(:id, 'employee_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'auto approval-three')
    driver.find_element(xpath: '/html/body/section[2]/div/div[3]/div/form/div/div[3]/input').click
    driver.find_element(id: 'continue-purge').click
    driver.find_element(xpath: '//*[@id="purge_data_modal"]/div/div/div[3]/button[2]').click
  end

  def purge_holiday_data_auto_approval_employee_four
    driver.navigate.to('https://hr.breathehrstaging.com/account/purge_data')
    drop = driver.find_element(:id, 'employee_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'non auto approved')
    driver.find_element(xpath: '/html/body/section[2]/div/div[3]/div/form/div/div[3]/input').click
    driver.find_element(id: 'continue-purge').click
    driver.find_element(xpath: '//*[@id="purge_data_modal"]/div/div/div[3]/button[2]').click
  end
end
