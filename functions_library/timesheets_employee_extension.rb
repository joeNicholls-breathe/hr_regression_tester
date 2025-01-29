# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength

class TimesheetEmpExtension < Base
  def my_timesheets
    driver.find_element(link_text: 'My Timesheets').click
  end

  def last_six_months
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div[1]/div/div/div/div[1]/label[4]').click
  end

  def add_timesheet_pending_approval_employee_last_week
    driver.find_element(xpath: '//*[@id="createTimesheetBtn"]').click
    sleep 0.25
    driver.find_element(css: 'input[data-testid=elmo-input-default]').click
    sleep 0.25
    driver.find_element(xpath: '//*[text() = "15"]').click
    sleep 0.25
    driver.find_element(id: 'start-time-input').send_keys :backspace
    driver.find_element(id: 'start-time-input').send_keys :backspace
    driver.find_element(id: 'start-time-input').send_keys :backspace
    driver.find_element(id: 'start-time-input').send_keys :backspace
    driver.find_element(id: 'start-time-input').send_keys :backspace
    driver.find_element(id: 'start-time-input').send_keys '09:03'
    driver.find_element(id: 'end-time-input').send_keys :backspace
    driver.find_element(id: 'end-time-input').send_keys :backspace
    driver.find_element(id: 'end-time-input').send_keys :backspace
    driver.find_element(id: 'end-time-input').send_keys :backspace
    driver.find_element(id: 'end-time-input').send_keys :backspace
    driver.find_element(id: 'end-time-input').send_keys '17:03'
    sleep 0.25
    driver.find_element(xpath: '/html/body/div[3]/div[3]/div/div[3]/button[2]').click
  end

  def approved_only_timesheet
    # amend filter to approved only
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div[1]/div/div/div/div[2]/div/div/div/button').click
    driver.find_element(id: 'elmo-checkbox-pending').click
    driver.find_element(xpath: '//*[@id="FilterCustomModal"]/div[3]/div/div[2]/button').click
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
