# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/ClassLength
class RotaExtension < Base
  def navigate_to_rota_from_hr_admin
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-rota]').click
    sleep 0.5
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-rota]').click
  end

  def navigate_to_timeandattendance_daily_from_hr_admin
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-time_attendance]').click
    sleep 0.5
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-timesheets_daily]').click
  end

  def my_employee_dashboard_rota
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-rota]').click
    sleep 0.5
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-employee_dashboard]').click
  end

  def find_employee_time_from_card
    driver.find_element(class: 'roster-map-1-0 shift-card-view__time')
  end

  def assign_one_shift_monday_std_employee
    driver.find_element(css: '#header-navigation-right').click
    # roster item 0 = monday 7 = sunday
    driver.find_element(css: '#user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    driver.find_element(css: 'input[id=roster-time-range-input]').send_keys '10.12-17.13'
    driver.find_element(css: '.input-with-icon__icon-wrapper > svg:nth-child(1)').click
  end

  def assign_multiple_shifts_std_employee
    driver.find_element(css: '#header-navigation-right').click
    sleep 1
    driver.find_element(css: '#header-navigation-right').click
    driver.find_element(css: '#user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    driver.find_element(css: 'input[id=roster-time-range-input]').send_keys '10.12-17.13'
    driver.find_element(css: '.input-with-icon__icon-wrapper > svg:nth-child(1)').click
    sleep 1
    driver.find_element(css: '#user-cell-0-roster-2-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    driver.find_element(css: 'input[id=roster-time-range-input]').send_keys '10.12-17.13'
    driver.find_element(css: '.input-with-icon__icon-wrapper > svg:nth-child(1)').click
    sleep 1
    driver.find_element(css: '#user-cell-0-roster-4-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    driver.find_element(css: 'input[id=roster-time-range-input]').send_keys '10.12-17.13'
    driver.find_element(css: '.input-with-icon__icon-wrapper > svg:nth-child(1)').click
  end

  def share_shift
    driver.find_element(css: 'button[id=share-roster]').click
    driver.find_element(css: 'button[id=publish-changes-btn]').click
  end

  def edit_shift_monday_std_employee
    driver.find_element(css: '#user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    sleep 0.25
    driver.find_element(id: 'start-time-input').clear
    sleep 1
    driver.find_element(id: 'end-time-input').clear
    sleep 1
    driver.find_element(id: 'start-time-input').send_keys '8:30'
    sleep 1
    driver.find_element(id: 'end-time-input').send_keys '16:30'
    sleep 1
    element = driver.find_element(id: 'elmo-checkbox-label-notify-now-checkbox')
    driver.execute_script("arguments[0].scrollIntoView(true);", element)
    sleep 1
    driver.find_element(xpath: '//*[@id="rostered-shift-modal"]/div[3]/div/div[2]/div[5]/div/div/div/div/div[2]').click
    sleep 1
    driver.find_element(xpath: '//*[@id="rostered-shift-modal"]/div[3]/div/div[2]/div[5]/div/div/div/div/div[2]/div[1]/div').send_keys ("Testing note added in edit on #{todays_date_string}")
    sleep 1
    driver.find_element(xpath: '//*[@id="submit-rostered-shift-btn"]/span[1]').click
  end

  def delete_shift
    driver.find_element(css: '#user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    sleep 0.25
    driver.find_element(id: 'delete-tab-btn').click
    sleep 0.25
  end

  def decline_shift
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div[2]/div/div/
      div[1]/div[1]/div[3]/div/div/div/div/div/button/span[4]').click
    driver.find_element(xpath: '//*[@id="elmo-dropdown2"]/li[2]').click
    driver.find_element(id: 'offer-note-text-area').send_keys ("Test #{todays_date_string}")
    driver.find_element(css: 'button[data-testid=offer-shift-dialog-submit]').click
    sleep 0.25
  end

  def swap_shift
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div[2]/div/div/div[2]/div[1]/div[3]/div/div/div/div/div/button').click
    driver.find_element(xpath: '//*[@id="elmo-dropdown3"]/li[1]').click
    driver.find_element(id: 'swap-not-text-area').send_keys ("Test #{todays_date_string}")
    driver.find_element(css: '#swap-done-button').click
  end

  def bulk_delete_shifts
    driver.find_element(css: '#bulk-delete-btn > span.elmo-btn__pressed').click
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div[4]/
      div[2]/div/div[2]/div[3]/div[1]/div/div').click
    sleep 0.25
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[1]/div/div/div[2]/div/button[1]/span[1]').click
    sleep 0.25
    driver.find_element(xpath: '//*[@id="confirm-bulk-delete-modal"]/div[3]/div/div[2]/button[2]').click
    sleep 0.25
    driver.find_element(xpath: '//*[@id="confirm-bulk-delete-modal"]/div[3]/div/div[2]/button[2]').click
    sleep 0.25
  end

  def create_template
    driver.find_element(id: 'copy-week-actions').click
    driver.find_element(css: 'div[data-testid=save-roster-template-btn]').click
    driver.find_element(id: 'template-name').send_keys todays_date_string
    sleep 1
    driver.find_element(xpath: '//*[@id="save-template-modal"]/div[3]/div/div[2]/button[1]').click
    sleep 5
  end

  def assign_template
    driver.find_element(css: '#header-navigation-right').click
    driver.find_element(xpath: '//*[@id="roster-template"]').click  
    driver.find_element(xpath: '//*[@id="templates-modal"]/div[3]/div/div[1]/div/div/div/div[2]/div[2]/div/div').click
    sleep 1
    driver.find_element(xpath: '//*[@id="apply-template"]').click
    sleep 5
  end

  def delete_template
    driver.find_element(id:'roster-template').click
    sleep 1
    driver.find_element(id:'delete-template-0').click
    sleep 1
    driver.find_element(id:'delete-template-btn').click
  end

  def add_timesheet_pending_approval_manager
    driver.find_element(css: 'div[data-testid=add-timesheet-placeholder]').click
    driver.find_element(css: 'input[data-testid=elmo-input-default]').send_keys '8'
    driver.find_element(css: 'input[data-testid=elmo-input-default]').send_keys '16'
    # might have an issue submitting this
  end
  
  def add_timesheet_pending_approval_employee
    driver.find_element(xpath: '//*[@id="createTimesheetBtn"]').click
    driver.find_element(id:'date-input').send_keys two_week_date_string
    driver.find_element(id:'start-time-input').send_keys '11:00'
    driver.find_element(id:'end-time-input').send_keys '17:00'
    driver.find_element(xpath:'/html/body/div[3]/div[3]/div/div[3]/button[2]').click
  end

  def employee_view_next_seven_days
    driver.find_element(xpath: '/html/body/div[2]/div[1]/main/div[3]/div/
      div[1]/div/div/div[1]/label[2]/span[2]/span').click
  end

  def employee_check_assigned_rota_template
    rota_template = driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div[2]/div/div/
      div[1]/div[2]/div/div[2]/div[1]/div[1]/div/div')
    template = rota_template.attribute('innerHTML')
    s = template.to_s
    s1 = 'employee - Sales, regression rota'
    puts s == s1
  end

  def view_notifications_employee_shifts
    driver.find_element(xpath: '//*[@id="undefined-tooltip"]/div/div/button').click
  end

  def approve_timesheet
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div[3]/div[3]/div/div[2]/div/div[2]/div/div/div').click
    driver.find_element(xpath: '')
  end

  def reject_timesheet
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div[3]/div[3]/div/div[2]/div/div[2]/div/div/div').click
  end

  def bulk_approve
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[1]/div/div[3]/div/div[2]/button/span[2]').click
  end

  def remove_timesheet
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[1]/div/div[3]/div/div[2]/button/span[2]').click
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/ClassLength
