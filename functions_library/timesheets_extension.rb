# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/ClassLength

class TimesheetExtension < Base
  def navigate_to_timeandattendance_daily_from_hr
    sleep @sleep_time_long
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-time_attendance]').click
    sleep @sleep_time_short
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-timesheets_daily]').click
  end

  def navigate_to_timeandattendance_weekly_from_hr
    sleep @sleep_time_long
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-time_attendance]').click
    sleep @sleep_time_short
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-timesheets_weekly]').click
  end

  def navigate_to_yesterday_lastweek
    driver.find_element(css: 'svg[data-testid=ChevronLeftIcon]').click
    sleep 1
  end

  def add_timesheet_to_employee_today
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
    driver.find_element(id: 'timesheet-end').send_keys '20:01'
    # break time
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys '17:01'
    sleep 1.0
    driver.find_element(css: '#new-shift-card >
     div.MuiCardActions-root.MuiCardActions-spacing.action-shift-card__actions.css-3zukih >
      button:nth-child(1)').click
    driver.find_element(css: '#new-shift-card >
     div.MuiCardActions-root.MuiCardActions-spacing.action-shift-card__actions.css-3zukih >
      button:nth-child(1)').click
  end

  def add_timesheet_to_employee_yesterday
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
    driver.find_element(id: 'timesheet-start').send_keys '13:02'
    # end time
    driver.find_element(id: 'timesheet-end').send_keys '21:02'
    # break time
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys '17:02'
    sleep 1.0
    driver.find_element(css: '#new-shift-card >
     div.MuiCardActions-root.MuiCardActions-spacing.action-shift-card__actions.css-3zukih >
      button:nth-child(1)').click
    driver.find_element(css: '#new-shift-card >
     div.MuiCardActions-root.MuiCardActions-spacing.action-shift-card__actions.css-3zukih >
      button:nth-child(1)').click
  end

  def add_timesheet_weekly_view
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div[3]/div[3]/div/div[2]/div/div[5]').click
  end

  def add_timesheet_pending_approval_manager
    driver.find_element(css: 'div[data-testid=add-timesheet-placeholder]').click
    driver.find_element(css: 'input[data-testid=elmo-input-default]').send_keys '8'
    driver.find_element(css: 'input[data-testid=elmo-input-default]').send_keys '16'
    # might have an issue submitting this
  end

  def approve_timesheet
    # This will approve any timesheet on the date you have selected, so to approve
    # multiple you would click this multiple times
    driver.find_element(css: 'svg[data-testid=CheckOutlinedIcon]').click
  end

  def edit_timesheet_on_daily
    driver.find_element(css: 'svg[data-testid=MoreHorizOutlinedIcon]').click
    sleep 0.5
    driver.find_element(xpath: '/html/body/div[3]/div[3]/ul/li[1]').click
    driver.find_element(id: 'timesheet-start').send_keys :backspace
    driver.find_element(id: 'timesheet-start').send_keys :backspace
    driver.find_element(id: 'timesheet-start').send_keys :backspace
    driver.find_element(id: 'timesheet-start').send_keys :backspace
    driver.find_element(id: 'timesheet-start').send_keys :backspace
    driver.find_element(id: 'timesheet-start').send_keys '10:15'
    driver.find_element(id: 'timesheet-end').send_keys :backspace
    driver.find_element(id: 'timesheet-end').send_keys :backspace
    driver.find_element(id: 'timesheet-end').send_keys :backspace
    driver.find_element(id: 'timesheet-end').send_keys :backspace
    driver.find_element(id: 'timesheet-end').send_keys :backspace
    driver.find_element(id: 'timesheet-end').send_keys '18:15'
    # add note
    driver.find_element(css: 'textarea[data-testid=elmo-textarea-default]')
          .send_keys "Test edit timesheet #{todays_date_string}"
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div[2]/div/div/div[3]/button[1]').click
  end

  def remove_timesheet_daily
    driver.find_element(css: 'svg[data-testid=MoreHorizOutlinedIcon]').click
    driver.find_element(xpath: '/html/body/div[3]/div[3]/ul/li[2]').click
    sleep 0.25
    driver.find_element(xpath: '//*[@id="delete-todays-shift-modal-dialog"]/div[3]/div/div[2]/button[2]').click
    sleep 5
  end

  def approve_weekly_view_timesheets
    driver.find_element(css: '').click
  end

  def edit_timesheet_weekly_view
    driver.find_element(css: '').click
  end

  def bulk_approve
    # can it be done on lm view of weekly will i need more data?
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[1]/div/div[3]/div/div[2]/button/span[2]').click
  end

  def bulk_remove
    driver.find_element(css: '').click
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/ClassLength
