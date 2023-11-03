# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class LeaveRequestExtension < Base
  # rubocop:disable Metrics/AbcSize
  def employee_holiday_leave_request_one
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys '15/12/2023' # start date
    driver.find_element(id: 'leave_request_half_start_true').click # half day
    driver.find_element(id: 'leave_request_half_start_am_pm_am').click # am
    driver.find_element(id: 'leave_request_half_start_am_pm_pm').click # pm
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys '15/12/2023' # end date
    driver.find_element(id: 'leave_request_notes').send_keys 'Test Leave request as employee reference no. DATE' # note
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def employee_holiday_leave_request_two
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys '11/01/2024' # start date
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys '12/01/2024' # end date
    driver.find_element(id: 'leave_request_notes').send_keys 'Test Leave request as employee reference no. DATE' # note
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def employee_holiday_leave_request_next_year
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys '30/12/2024' # start date
    driver.find_element(id: 'leave_request_half_start_true').click # half day
    driver.find_element(id: 'leave_request_half_start_am_pm_am').click # am
    driver.find_element(id: 'leave_request_half_start_am_pm_pm').click # pm
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys '30/12/2024' # end date
    driver.find_element(id: 'leave_request_notes').send_keys 'Test Leave request as employee reference no. DATE' # note
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def employee_holiday_leave_request_last_year
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys '30/12/2022' # start date
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys '30/12/2022' # end date
    driver.find_element(id: 'leave_request_notes').send_keys 'Test Leave request as employee reference no. DATE' # note
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def employee_holiday_leave_request_on_saturday
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys '30/12/2023' # start date
    driver.find_element(id: 'leave_request_half_start_true').click # half day
    driver.find_element(id: 'leave_request_half_start_am_pm_am').click # am
    driver.find_element(id: 'leave_request_half_start_am_pm_pm').click # pm
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys '30/12/2023' # end date
    driver.find_element(id: 'leave_request_notes').send_keys 'Test Leave request as employee reference no. DATE' # note
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def employee_holiday_leave_in_carry_over
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys '04/01/2023' # start date
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys '04/01/2023' # end date
    driver.find_element(id: 'leave_request_notes').send_keys 'Testing leave request uses carry over' # note
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def negative_carry_over_employee_holiday_leave_this_year
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys '16/10/2023' # start date
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys '27/10/2023' # end date
    driver.find_element(id: 'leave_request_notes').send_keys 'Testing leave request uses carry over' # note
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def negative_carry_over_employee_holiday_next_years_allowance
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys '20/11/2023' # start date
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys '24/11/2023' # end date
    driver.find_element(id: 'leave_request_notes').send_keys 'Testing leave request uses carry over' # note
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def delete_leave_request_booked
    driver.find_element(css: '#DataTables_Table_1 > tbody > tr > td.actions > a:nth-child(2) > svg').click
    driver.find_element(css: '#leave_request_cancellation_reason').send_keys 'Cancel Leave request'
    driver.find_element(css: '#new_leave_request > p > input').click
  end

  def delete_leave_request_requested
    deleteleave = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(1)')
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > svg').click
    attribute_value = deleteleave.attribute('href')
    split_value = attribute_value.split('/')[6]
    selector = "#delete_pending_leave_request_#{split_value}
                > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm"
    driver.find_element(css: selector).click
  end
  # rubocop:enable Metrics/AbcSize
end
