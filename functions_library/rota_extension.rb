# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

# rubocop:disable Metrics/AbcSize
class RotaExtension < Base
  def navigate_to_rota_from_hr_admin
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-rota]').click
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-rota]').click
  end

  def navigate_to_timeandattendance_from_hr_admin
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-time_attendance]').click
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-timesheets_daily]').click
  end

  def assign_one_shift
    driver.find_element(xpath: '//*[@id="header-navigation-right"]/span[4]').click
    driver.find_element(css: settings[:staging][:rota_assign_shift_to_admin_user]).click
    driver.find_element(css: 'input[id=roster-time-range-input]').send_keys '9-17'
    driver.find_element(css: '.input-with-icon__icon-wrapper > svg:nth-child(1)').click
  end

  def share_shift
    driver.find_element(css: 'button[id=share-roster]').click
    driver.find_element(css: 'button[id=publish-changes-btn]').click
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
    driver.find_element(css: 'span[data-testid=elmo-btn-icon-copy-week-actions]').click
    driver.find_element(css: 'div[data-testid=save-roster-template-btn]').click
    driver.find_element(id: 'template-name').send_keys todays_date
    driver.find_element(xpath: '//*[@id="save-template-modal"]/div[3]/div/div[2]/button[1]').click
  end

  def assign_template
    driver.find_element(xpath: '//*[@id="header-navigation-right"]/span[4]').click
    driver.find_element(css: 'span[data-testid=elmo-btn-label-roster-template]').click
    driver.find_element(xpath: '//*[@id="templates-modal"]/div[3]/div/div[1]/div/div/div/div[2]/div[2]/div/div').click
    sleep 0.25
    driver.find_element(xpath: '//*[@id="apply-template"]').click
    # sleep or wait for an elemenr - record is pasted and takes an age / or could try a page refresh
  end

  def add_timesheet_pending_approval
    driver.find_element(css: 'div[data-testid=add-timesheet-placeholder]').click
    driver.find_element(css: 'input[data-testid=elmo-input-default]').send_keys '8'
    driver.find_element(css: 'input[data-testid=elmo-input-default]').send_keys '16'
    # might have an issue submitting this
  end

  def approve_timesheet
    driver.find_element(css: '').click
  end

  def reject_timesheet
    driver.find_element(css: '').click
  end

  def remove_timesheet
    driver.find_element(css: '').click
  end

  def view_notifications_employee_shifts
    driver.find_element(css: '').click
  end
end
# rubocop:enable Metrics/AbcSize
