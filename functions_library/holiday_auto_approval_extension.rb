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
end
