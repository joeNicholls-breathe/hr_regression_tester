# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class OtherLeaveRequestExtension < Base
  # rubocop:disable Metrics/AbcSize
  def employee_holiday_other_leave_request
    driver.find_element(id: 'leave_request_kind_of_otherleave').click # other
    drop = driver.find_element(id: 'leave_request_company_leave_reason_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Compassionate')
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys '15/12/2025' # start date
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys '15/12/2025' # end date
    driver.find_element(id: 'leave_request_notes').send_keys 'Test other leave request' # note
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def other_leave_request_for_next_monday
    driver.find_element(id: 'leave_request_kind_of_otherleave').click
    driver.find_element(id: 'leave_request_company_leave_reason_id').click
    drop = driver.find_element(id: 'leave_request_company_leave_reason_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Compassionate')
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys next_monday
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys next_monday
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
    sleep @sleep_time_short
  end

  def navigate_to_purge_data
    driver.navigate.to('https://hr.breathehrstaging.com/account/purge_data')
  end

  def select_rota_employee_other_leave_to_purge(employee_name)
    navigate_to_purge_data
    # HolidayExtension.new(driver).navigate_to_purge_data
    drop = driver.find_element(:id, 'employee_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, employee_name)
    drop = driver.find_element(:id, 'area')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Other Leave')
    driver.find_element(class: 'confirm-checkbox').click
    driver.find_element(id: 'continue-purge').click
    driver.find_element(xpath: '//*[@id="purge_data_modal"]/div/div/div[3]/button[2]').click
  end
  # rubocop:enable Metrics/AbcSize
end
