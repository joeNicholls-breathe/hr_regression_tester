# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class TimesheetExtension < Base
  def navigate_to_timeandattendance_daily_from_hr_admin
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-time_attendance]').click
    sleep 1
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-timesheets_daily]').click
  end

  # rubocop:disable Metrics/AbcSize
  def add_timesheet_to_employee
    driver.find_element(css: 'span[data-testid=elmo-btn-label-new-shift-form]').click
    # shift employee
    driver.find_element(id: 'shift-user').click
    driver.find_element(class: 'react-select__single-value css-qc6sy-singleValue').send_keys 'Std Employee User'
    # project
    driver.find_element(id: 'react-select-4-input').click
    # department
    driver.find_element(id: 'react-select-5-input').click
    # start
    driver.find_element(id: 'timesheet-start').send_keys '12:01'
    # end
    driver.find_element(id: 'timesheet-end').send_keys '20:02'
    # break
    driver.find_element(id: 'break-start-input-0').send_keys '17:00'
  end
  # rubocop:enable Metrics/AbcSize

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
