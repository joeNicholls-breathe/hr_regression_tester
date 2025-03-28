# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

# rubocop:disable Metrics/AbcSize
class LeaveRequestExtension < Base
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

  def employee_ignore_wp_holiday_record
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys '22/12/2025' # start date
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys '31/12/2025' # start date
    driver.find_element(id: 'leave_request_notes').send_keys 'Test absence for ignoring work pattern' # note
    driver.find_element(id: 'leave_request_deducted').send_keys 10
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def employee_leave_request_today
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys todays_date_string
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys todays_date_string
    driver.find_element(id: 'leave_request_notes').send_keys 'Testing leave request uses carry over' # note
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def employee_leave_request_in_two_weeks
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys two_week_date_string
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys two_week_date_string
    driver.find_element(id: 'leave_request_notes').send_keys 'Testing leave request uses carry over' # note
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def employee_leave_request_overlapping_in_two_weeks
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys todays_date + 12.days
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys todays_date + 15.days
    driver.find_element(id: 'leave_request_notes').send_keys 'Testing leave request uses carry over' # note
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def employee_leave_request_overides_blackout
    driver.find_element(id: 'leave_request_ignore_blackout_clashes').click
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def make_leave_request(start_date, end_date)
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys start_date # start date
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys end_date # end date
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def make_leave_request_half_day(start_date, end_date)
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys start_date # start date
    driver.find_element(id: 'leave_request_half_start_true').click # half day
    driver.find_element(id: 'leave_request_half_start_am_pm_am').click # am
    driver.find_element(id: 'leave_request_half_start_am_pm_pm').click # pm
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys end_date # end date
    driver.find_element(id: 'leave_request_notes').send_keys 'Test Leave request as employee reference no. DATE' # note
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def click_add_new_leave_request
    # rubocop:disable Layout/LineLength
    driver.find_element(
      css: 'body > div.hr-main-container > div > section > div.employee-section-header > div > a > span > svg.svg-inline--fa.fa-plus.fa-w-14.fa-inverse.fa-stack-1x'
    ).click
    # rubocop:enable Layout/LineLength
  end

  def make_cancellation_request
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(2) > svg > path').click
    sleep 1
    driver.find_element(id: 'leave_request_cancellation_reason').send_keys 'Cancelling Request'
    driver.find_element(class: 'btn-success').click
  end

  def find_request_status
    table_row = driver.find_element(class: 'odd')
    table_row.find_element(css: '#DataTables_Table_0 > tbody > tr > td:nth-child(6)').text
  end

  def compare_request_status(expected_status)
    status = find_request_status
    if status == expected_status
      puts "PASS - Request Status is #{expected_status}"
    else
      puts "FAIL - Request Status is incorrect, is currently #{status}"
    end
  end
end
# rubocop:enable Metrics/AbcSize
