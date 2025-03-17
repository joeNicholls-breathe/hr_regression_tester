# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/ClassLength
# rubocop:disable Metrics/MethodLength
# rubocop:disable Layout/LineLength
class RotaExtension < Base
  def navigate_to_rota_from_hr_admin
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-rota]').click
    sleep 2
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-rota]').click
  end

  def find_employee_time_from_card
    driver.find_element(class: 'roster-map-1-0 shift-card-view__time')
  end

  def assign_one_shift_monday_std_employee
    # roster item 0 = monday 7 = sunday
    sleep @sleep_time_short
    driver.find_element(css: '#user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    driver.find_element(css: 'input[id=roster-time-range-input]').send_keys '10.10-17.10'
    driver.find_element(css: '.input-with-icon__icon-wrapper > svg:nth-child(1)').click
  end

  def assign_multiple_shifts_std_employee
    driver.find_element(css: '#user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    driver.find_element(css: 'input[id=roster-time-range-input]').send_keys '11.11-19.11'
    driver.find_element(css: '.input-with-icon__icon-wrapper > svg:nth-child(1)').click
    sleep @sleep_time_long
    driver.find_element(css: '#user-cell-0-roster-2-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    driver.find_element(css: 'input[id=roster-time-range-input]').send_keys '11.12-19.12'
    driver.find_element(css: '.input-with-icon__icon-wrapper > svg:nth-child(1)').click
    sleep @sleep_time_short
    driver.find_element(css: '#user-cell-0-roster-4-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    driver.find_element(css: 'input[id=roster-time-range-input]').send_keys '11.13-19.13'
    driver.find_element(css: '.input-with-icon__icon-wrapper > svg:nth-child(1)').click
  end

  def share_shift
    sleep 3
    driver.find_element(css: 'button[id=share-roster]').click
    driver.find_element(css: 'button[id=publish-changes-btn]').click
  end

  def edit_shift_monday_std_employee
    driver.find_element(css: '#user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    sleep @sleep_time_short
    driver.find_element(css: 'input[data-testid=elmo-input-default]').clear
    driver.find_element(css: 'input[data-testid=elmo-input-default]').send_keys :backspace
    driver.find_element(css: 'input[data-testid=elmo-input-default]').send_keys one_week_one_day_string
    driver.find_element(id: 'start-time-input').send_keys :backspace
    driver.find_element(id: 'start-time-input').send_keys :backspace
    driver.find_element(id: 'start-time-input').send_keys :backspace
    driver.find_element(id: 'start-time-input').send_keys :backspace
    driver.find_element(id: 'start-time-input').send_keys :backspace
    driver.find_element(id: 'start-time-input').send_keys '8:30'
    driver.find_element(id: 'end-time-input').send_keys :backspace
    driver.find_element(id: 'end-time-input').send_keys :backspace
    driver.find_element(id: 'end-time-input').send_keys :backspace
    driver.find_element(id: 'end-time-input').send_keys :backspace
    driver.find_element(id: 'end-time-input').send_keys :backspace
    driver.find_element(id: 'end-time-input').send_keys '16:30'
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys :backspace
    driver.find_element(id: 'break-start-input-0').send_keys '12:30'
    element = driver.find_element(id: 'elmo-checkbox-label-notify-now-checkbox')
    driver.execute_script('arguments[0].scrollIntoView(true);', element)
    driver.find_element(xpath: '//*[@id="submit-rostered-shift-btn"]/span[1]').click
  end

  def navigate_to_the_next_monday_shift
    driver.find_element(css: '#header-navigation-right').click
  end

  def navigate_to_last_monday_shift
    driver.find_element(css: '#header-navigation-left').click
  end

  def delete_shift
    driver.find_element(css: '#user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    sleep @sleep_time_short
    driver.find_element(id: 'delete-tab-btn').click
  end

  def delete_shift_with_leave
    driver.find_element(css: '#user-cell-1-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    sleep @sleep_time_short
    driver.find_element(id: 'delete-tab-btn').click
  end

  def delete_shift_wednesday
    driver.find_element(css: '#user-cell-0-roster-2-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    sleep @sleep_time_short
    driver.find_element(id: 'delete-tab-btn').click
  end

  def bulk_delete_shifts_admin
    driver.find_element(css: '#bulk-delete-btn > span.elmo-btn__pressed').click
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div[4]
      /div[2]/div/div[2]/div[5]/div[1]/div').click
    sleep 1
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[1]/div/div/div[2]/div/button[1]/span[1]').click
    sleep @sleep_time_short
    driver.find_element(xpath: '//*[@id="confirm-bulk-delete-modal"]/div[3]/div/div[2]/button[2]').click
    sleep @sleep_time_short
  end

  def bulk_delete_shifts_employee_with_swaps
    driver.find_element(css: '#bulk-delete-btn > span.elmo-btn__pressed').click
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div[4]
      /div[2]/div/div[2]/div[4]/div[1]/div').click
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[1]/div/div/div[2]/div/button[1]/span[1]').click
    sleep @sleep_time_short
    driver.find_element(xpath: '//*[@id="confirm-bulk-delete-modal"]/div[3]/div/div[2]/button[2]').click
    sleep @sleep_time_short
    driver.find_element(xpath: '//*[@id="confirm-bulk-delete-modal"]/div[3]/div/div[2]/button[2]').click
  end

  def bulk_delete_shifts_employee
    driver.find_element(css: '#bulk-delete-btn > span.elmo-btn__pressed').click
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div[4]
      /div[2]/div/div[2]/div[4]/div[1]/div').click
    sleep 1
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[1]/div/div/div[2]/div/button[1]/span[1]').click
    sleep @sleep_time_short
    driver.find_element(xpath: '//*[@id="confirm-bulk-delete-modal"]/div[3]/div/div[2]/button[2]').click
    sleep @sleep_time_short
  end

  def bulk_delete_cancel_button
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[1]/div/div/div[2]/div/button[2]').click
  end

  def create_template
    driver.find_element(id: 'copy-week-actions').click
    driver.find_element(css: 'div[data-testid=save-roster-template-btn]').click
    driver.find_element(id: 'template-name').send_keys todays_date_string
    sleep @sleep_time_short
    driver.find_element(id: 'template-name').send_keys :backspace
    driver.find_element(id: 'template-name').send_keys :backspace
    driver.find_element(id: 'template-name').send_keys :backspace
    driver.find_element(id: 'template-name').send_keys :backspace
    driver.find_element(id: 'template-name').send_keys '25a'
    sleep @sleep_time_long
    driver.find_element(id: 'save-template-btn').click
    sleep @sleep_time_long
  end

  def assign_template
    driver.find_element(xpath: '//*[@id="roster-template"]').click
    driver.find_element(xpath: '//*[@id="templates-modal"]/div[3]/div/div[1]/div/div/div/div[2]/div[2]/div/div').click
    sleep @sleep_time_long
    driver.find_element(xpath: '//*[@id="apply-template"]').click
    sleep @sleep_time_long
  end

  def delete_template
    driver.find_element(id: 'roster-template').click
    sleep @sleep_time_short
    driver.find_element(id: 'delete-template-0').click
    sleep @sleep_time_short
    driver.find_element(id: 'delete-template-btn').click
    sleep @sleep_time_short
    # if we can not delete the template - organise logic maybe just refresh page but this would be a cheat
    driver.find_element(xpath: '//*[@id="templates-modal"]/div[3]/div/div[2]/button[1]').click
  end

  def open_template_modal
    driver.find_element(id: 'roster-template').click
  end

  def create_shift_with_leave
    driver.find_element(css: '#user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    driver.find_element(xpath: '//*[@id="user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17"]/div/div[2]').click
    driver.find_element(id: 'start-time-input').send_keys :backspace
    driver.find_element(id: 'start-time-input').send_keys :backspace
    driver.find_element(id: 'start-time-input').send_keys :backspace
    driver.find_element(id: 'start-time-input').send_keys :backspace
    driver.find_element(id: 'start-time-input').send_keys :backspace
    driver.find_element(id: 'start-time-input').send_keys '09:31'
    driver.find_element(id: 'end-time-input').send_keys :backspace
    driver.find_element(id: 'end-time-input').send_keys :backspace
    driver.find_element(id: 'end-time-input').send_keys :backspace
    driver.find_element(id: 'end-time-input').send_keys :backspace
    driver.find_element(id: 'end-time-input').send_keys :backspace
    driver.find_element(id: 'end-time-input').send_keys '17:31'
    driver.find_element(xpath: '//*[@id="submit-rostered-shift-btn"]/span[1]').click
  end

  def shift_with_leave_accept
    driver.find_element(css: '#approve-overlap-btn').click
  end

  def navigate_to_rota_employees_people
    sleep @sleep_time_short
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-rota]').click
    sleep @sleep_time_short
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-people]').click
  end

  def search_employee_on_people_page
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[1]/div/div[3]/div/button[1]').click
    driver.find_element(id: 'search-bar').send_keys 'Newemployee'
  end

  def select_employee
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div/div[2]').click
  end

  def edit_employee_details
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div[4]/div/div[1]/div/button').click
    driver.find_element(xpath: '//*[@id="role"]').click
    driver.find_element(xpath: '//*[@id="menu-role_id"]/div[3]/ul/li[7]').click
    driver.find_element(id: 'area').click
    driver.find_element(xpath: '//*[@id="menu-areaId"]/div[3]/ul/li[2]').click
    sleep @sleep_time_short
    driver.find_element(xpath: '//*[@id="user-add-roles-modal"]/div[3]/div/div[2]/button[2]').click
    sleep @sleep_time_short
  end

  def change_primary_job
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div[4]/div/div[1]/div/button').click
    driver.find_element(xpath: '//*[@id="user-add-roles-modal"]/div[3]/div/div[1]/form/div[3]/div[2]/div[1]/div/a').click
    driver.find_element(xpath: '//*[@id="user-add-roles-modal"]/div[3]/div/div[1]/form/div[3]/div[2]/div[2]/div[1]/span').click
    driver.find_element(xpath: '//*[@id="user-add-roles-modal"]/div[3]/div/div[1]/form/div[3]/div[2]/div[1]/div/a').click
    driver.find_element(xpath: '//*[@id="user-add-roles-modal"]/div[3]/div/div[2]/button[2]').click
    sleep @sleep_time_short
  end

  def return_to_people_index
    driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[1]/div[1]/div/div/div[1]/div[2]/div[1]/button').click
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/ClassLength
# rubocop:enable Metrics/MethodLength
# rubocop:enable Layout/LineLength
