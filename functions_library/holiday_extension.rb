# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

# # :
class HolidayExtension < Base # rubocop:disable Metrics/ClassLength
  def holiday_request_calendar_navigate_employee
    driver.find_element(css: 'href=["/employees/settings[:staging][:employee_id]/leave_requests/make_request"]').click
  end

  def holiday_employee_absence_index_requests
    driver.navigate.to('https://hr.breathehrstaging.com/employees/20717/holidays#tab_requests')
  end

  def carry_over_holiday_employee_absence_index_requests
    driver.navigate.to('https://hr.breathehrstaging.com/employees/21090/holidays#tab_requests')
  end

  def holiday_employee_absence_index
    driver.navigate.to('https://hr.breathehrstaging.com/employees/20717/holidays')
  end

  def employee_ignore_work_pattern_absence_index
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24930/holidays')
  end

  def carry_over_holiday_employee_absence_index
    driver.navigate.to('https://hr.breathehrstaging.com/employees/21090/holidays')
  end

  def negative_carry_over_holiday_employee_absence_index
    driver.navigate.to('https://hr.breathehrstaging.com/employees/21870/holidays')
  end

  def add_leave_request_for_carry_over_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/21090/leave_requests/new')
  end

  def add_leave_request_for_ignore_work_pattern_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24930/leave_requests/new')
  end

  def approve_leave_request
    # rubocop:disable Layout/LineLength
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr/td[7]/a[1]').click
    driver.find_element(
      css: 'body > div.hr-main-container > div > section > div.filter-controls > div.form-group.buttons > button.btn.btn-success'
    ).click
    driver.find_element(xpath: '/html/body/div[3]/div/section/div[4]/div[2]/div[2]/div/div/form/div[3]/input').click
    # rubocop:enable Layout/LineLength
  end

  def holiday_request_profile_navigate_employee
    driver.find_element(xpath: '//*[@id="leave"]').click
    driver.find_element(xpath: '/html/body/section[2]/div[2]/div/a').click
  end

  def booked_amount
    driver.find_element(id: 'booked-and-taken').text
  end

  def available_amount
    driver.find_element(id: 'available').text
  end

  def carried_amount_days
    driver.find_element(id: 'carryover-days').text
  end

  def negative_carry_over
    driver.find_element(id: 'negative-carryover').text
  end

  def used_from_next_year
    driver.find_element(
      css: '#allowance-breakdown > div:nth-child(5) > div.card-body > div.employee-metric-actions'
    ).text
  end

  def purge_holiday_data(employee_name)
    driver.navigate.to('https://hr.breathehrstaging.com/account/purge_data')
    drop = driver.find_element(:id, 'employee_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, employee_name)
    driver.find_element(class: 'confirm-checkbox').click
    driver.find_element(id: 'continue-purge').click
    driver.find_element(class: 'modal-confirm').click
  end

  def purge_other_leave_data(employee_name) # rubocop:disable Metrics/AbcSize
    driver.navigate.to('https://hr.breathehrstaging.com/account/purge_data')
    drop = driver.find_element(:id, 'employee_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, employee_name)
    drop_type = driver.find_element(id: 'area')
    choose = Selenium::WebDriver::Support::Select.new(drop_type)
    choose.select_by(:text, 'Other Leave')
    driver.find_element(class: 'confirm-checkbox').click
    driver.find_element(id: 'continue-purge').click
    driver.find_element(class: 'modal-confirm').click
  end

  def navigate_to_purge_data
    driver.navigate.to('https://hr.breathehrstaging.com/account/purge_data')
  end

  def cancel_form
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/a').click
  end

  def return_to_leave_reqest_from_form
    driver.find_element(xpath: '/html/body/section/div/div/div[2]/a').click
  end

  def holiday_manager_approval_from_dashboard
    driver.find_element(xpath: '//*[@id="tab-hr-dashboard"]/div/div[1]/div[3]/div[2]/div[1]/div[1]').click
    driver.find_element(class: '').click
  end

  def holiday_manager_reject
    driver.find_element(xpath: '//*[@id="tab-hr-dashboard"]/div/div[1]/div[3]/div[2]/div[1]/div[1]').click
    driver.find_element(xpath: '/html/body/section[2]/div[4]/div[2]/button[1]').click
    driver.find_element(xpath: 'leave_request_rejection_reason').send_keys 'manager rejects leave test DATE'
    driver.find_element(xpath: '//*[@id="edit_leave_request_10374"]/div[3]/input').click
  end

  def holiday_manager_reject_modal_cancel
    driver.find_element(xpath: '//*[@id="tab-hr-dashboard"]/div/div[1]/div[3]/div[2]/div[1]/div[1]').click
    driver.find_element(xpath: '/html/body/section[2]/div[4]/div[2]/button[1]').click
    driver.find_element(xpath: '//*[@id="edit_leave_request_10374"]/div[3]/button').click
  end

  def holiday_show_employee
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr/td[7]/a[1]/svg').click
  end

  def holiday_show_employee_delete
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/span/span/svg[1]').click
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/span/span/svg[1]').click
  end

  def holiday_employee_profile_delete
    driver.find_element(xpath: '/html/body/section[2]/div[7]/div[1]/div/table/tbody/tr/td[7]/svg').click
    driver.find_element(
      xpath: '/html/body/section[2]/div[7]/div[1]/div/table/tbody/tr/td[7]/div/div/div/div[3]/button[2]'
    ).click
  end

  def compare_booked_amount(expected_amount)
    sleep 2
    if HolidayExtension.new(driver).booked_amount == expected_amount
      puts 'PASS - booked_amount total correct'
    else
      puts 'FAIL - booked_amount total incorrect'
    end
  end

  def compare_holiday_allowance(expected_amount)
    if HolidayExtension.new(driver).available_amount.include? expected_amount
      puts 'PASS - available_amount total correct'
    else
      puts 'FAIL - available_amount total incorrect,'
    end
  end

  def compare_negative_allowance(expected_amount)
    if HolidayExtension.new(driver).negative_carry_over.include? expected_amount
      puts 'PASS - negative_amount total correct'
    else
      puts 'FAIL - negative_amount total incorrect'
    end
  end

  def compare_holiday_carried_daily(expected_amount)
    if HolidayExtension.new(driver).carried_amount_days.include? expected_amount
      puts 'PASS - carried_amount total correct'
    else
      puts 'FAIL - carried_amount total incorrect'
    end
  end

  def compare_holiday_used_from_next_year(expected_amount)
    used_from_next = HolidayExtension.new(driver).used_from_next_year
    if used_from_next.include? expected_amount
      puts 'PASS - used_from_next_year total correct'
    else
      puts 'FAIL - used_from_next_year total incorrect'
      puts used_from_next
    end
  end

  def holiday_request_for_next_monday
    driver.find_element(css: '#\#leave_request_start_date_react').send_keys next_monday
    driver.find_element(css: '#\#leave_request_end_date_react').send_keys next_monday
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def select_rota_employee_holiday_to_purge(employee_name)
    navigate_to_purge_data
    drop = driver.find_element(:id, 'employee_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, employee_name)
    driver.find_element(class: 'confirm-checkbox').click
    driver.find_element(id: 'continue-purge').click
    driver.find_element(xpath: '//*[@id="purge_data_modal"]/div/div/div[3]/button[2]').click
  end
end
