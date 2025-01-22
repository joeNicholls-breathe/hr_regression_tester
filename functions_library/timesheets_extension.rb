# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class TimesheetExtension < Base
  def navigate_to_timeandattendance_daily_from_hr_admin
    sleep @sleep_time_long
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-time_attendance]').click
    sleep @sleep_time_short
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-timesheets_daily]').click
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def add_timesheet_to_employee
    driver.find_element(css: 'span[data-testid=elmo-btn-label-new-shift-form]').click
    # shift employee
    driver.find_element(id: 'shift-user').click
    driver.find_element(xpath: '//*[text() = "Std Employee User"]').click
    sleep 0.25
    # department
    driver.find_element(id: 'area-role-dropdown').click
    driver.find_element(xpath: '//*[text() = "Sales - employee"]').click
    # project
    # driver.find_element(id: 'project').click
    # driver.find_element(xpath: '//*[text() = "Test Project One"]').click
    # start time
    driver.find_element(id: 'timesheet-start').send_keys '12:01'
    # end time
    driver.find_element(id: 'timesheet-end').send_keys '20:02'
    # break time
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys '17:00'
    sleep 1.0
    driver.find_element(css: '#new-shift-card >
     div.MuiCardActions-root.MuiCardActions-spacing.action-shift-card__actions.css-3zukih >
      button:nth-child(1)').click
    driver.find_element(css: '#new-shift-card >
     div.MuiCardActions-root.MuiCardActions-spacing.action-shift-card__actions.css-3zukih >
      button:nth-child(1)').click
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  def add_timesheet_pending_approval_manager
    driver.find_element(css: 'div[data-testid=add-timesheet-placeholder]').click
    driver.find_element(css: 'input[data-testid=elmo-input-default]').send_keys '8'
    driver.find_element(css: 'input[data-testid=elmo-input-default]').send_keys '16'
    # might have an issue submitting this
  end

  def approve_timesheet
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div[3]/div[3]/div/div[2]
      /div/div[2]/div/div/div').click
    driver.find_element(xpath: '')
  end

  def reject_timesheet
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div[3]/div[3]/div/div[2]
      /div/div[2]/div/div/div').click
  end

  def bulk_approve
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[1]/div/div[3]/div/div[2]/button/span[2]').click
  end

  def remove_timesheet
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[1]/div/div[3]/div/div[2]/button/span[2]').click
  end
end
