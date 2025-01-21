# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class TimesheetEmpExtension < Base
  def my_timesheets
    driver.find_element(link_text: 'My Timesheets').click
  end

  def add_timesheet_pending_approval_employee
    driver.find_element(xpath: '//*[@id="createTimesheetBtn"]').click
    driver.find_element(id: 'date-input').send_keys two_week_date_string
    driver.find_element(id: 'start-time-input').send_keys '11:00'
    driver.find_element(id: 'end-time-input').send_keys '17:00'
    driver.find_element(xpath: '/html/body/div[3]/div[3]/div/div[3]/button[2]').click
  end
end
