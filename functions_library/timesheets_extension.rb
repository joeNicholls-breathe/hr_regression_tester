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
    driver.find_element(xpath: '/html/body/div[2]/div[3]/form/div/div[2]/div[1]/div/input').send_keys '11.04'
    driver.find_element(xpath: '/html/body/div[2]/div[3]/form/div/div[2]/div[2]/div/input').send_keys '19.04'
    driver.find_element(xpath: '/html/body/div[2]/div[3]/form/div/div[2]/div[2]/div/input').send_keys :enter
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

  # Weekly view issues with page hidden menu of actions
  def approve_weekly_view_timesheets
    # rubocop:disable Layout/LineLength
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div[3]/div[3]/div/div[2]/div/div[5]/div/div/div').click
    # Issue with selecting the underlying approve icon
    # rubocop:enable Layout/LineLength
  end

  # approve, edit, add new and delete from the weekly tab can not currently be targeted
  def bulk_approve
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[1]/div/div[3]/div/div[2]').click
    # rubocop:disable Layout/LineLength
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div[3]/div[3]/div/div[2]/div/div[5]/div/div/div').click
    # rubocop:enable Layout/LineLength
    driver.find_element(css: 'button[data-testid=bulk-approve-confirm-btn]').click
    driver.find_element(css: 'button[data-testid=bulk-approve-modal-confirm-btn]').click
  end

  def bulk_remove
    driver.find_element(css: 'button[data-testid=bulk-delete-mode-btn]').click
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div[3]/div[3]/div/div[2]/div/div[1]').click
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div[3]/div[3]/div/div[2]/div/div[2]').click
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div[3]/div[3]/div/div[2]/div/div[3]').click
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div[3]/div[3]/div/div[2]/div/div[4]').click
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div[3]/div[3]/div/div[2]/div/div[5]').click
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div[3]/div[3]/div/div[2]/div/div[6]').click
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div[3]/div[3]/div/div[2]/div/div[7]').click
    driver.find_element(css: 'button[data-testid=bulk-delete-confirm-btn]').click
    driver.find_element(css: 'button[data-testid=bulk-delete-modal-confirm-btn]').click
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/ClassLength
