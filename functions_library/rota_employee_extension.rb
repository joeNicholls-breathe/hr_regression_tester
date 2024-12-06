# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)
# rubocop:disable Metrics/LineLength
class RotaEmpExtension < Base
  def my_employee_dashboard_rota
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-rota]').click
    sleep 0.5
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-employee_dashboard]').click
  end

  def my_employee_dashboard_timesheets
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-timesheets]').click
    sleep 0.5
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-employee_dashboard]').click
  end

  def decline_shift
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div[2]/div/div/
      div[1]/div[1]/div[3]/div/div/div/div/div/button/span[4]').click
    driver.find_element(xpath: '//*[@id="elmo-dropdown2"]/li[2]').click
    driver.find_element(id: 'offer-note-text-area').send_keys("Test #{todays_date_string}")
    driver.find_element(css: 'button[data-testid=offer-shift-dialog-submit]').click
    sleep 0.25
  end

  def swap_shift
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div[2]/div/div/div[2]/div[1]/div[3]/div/div/div/div/div/button').click
    driver.find_element(xpath: '//*[@id="elmo-dropdown3"]/li[1]').click
    driver.find_element(id: 'swap-not-text-area').send_keys("Test #{todays_date_string}")
    driver.find_element(css: '#swap-done-button').click
  end

  def add_timesheet_pending_approval_employee
    driver.find_element(xpath: '//*[@id="createTimesheetBtn"]').click
    driver.find_element(id: 'date-input').send_keys two_week_date_string
    driver.find_element(id: 'start-time-input').send_keys '11:00'
    driver.find_element(id: 'end-time-input').send_keys '17:00'
    driver.find_element(xpath: '/html/body/div[3]/div[3]/div/div[3]/button[2]').click
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

  def mark_all_as_read_and_delete
    driver.find_element(css: 'button[data-testid=elmo-btn-read-all]').click
    sleep 0.25
    driver.find_element(css: 'button[data-testid=elmo-btn-delete-all]').click
  end

  def close_notification_employee
    driver.find_element(class: 'elmo-modal__header-close').click
  end
end
# rubocop:enable Metrics/LineLength
