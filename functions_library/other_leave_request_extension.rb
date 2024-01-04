# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class OtherLeaveRequestExtension < Base
  # rubocop:disable Metrics/AbcSize
  def employee_holiday_other_leave_request
    driver.find_element(id: 'leave_request_kind_of_otherleave').click # other
    drop = driver.find_element(id: 'leave_request_company_leave_reason_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Compassionate')
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys '15/12/2024' # start date
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys '15/12/2024' # end date
    driver.find_element(id: 'leave_request_notes').send_keys 'Test other leave request' # note
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end
  # rubocop:enable Metrics/AbcSize
end
