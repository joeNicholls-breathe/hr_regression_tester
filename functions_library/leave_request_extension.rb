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

  def employee_holiday_leave_request_next_year
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys '30/12/2024' # start date
    driver.find_element(id: 'leave_request_half_start_true').click # half day
    driver.find_element(id: 'leave_request_half_start_am_pm_am').click # am
    driver.find_element(id: 'leave_request_half_start_am_pm_pm').click # pm
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys '30/12/2024' # end date
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
  # rubocop:enable Metrics/AbcSize
end
