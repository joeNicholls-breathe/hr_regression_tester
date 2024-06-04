# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

# rubocop:disable Metrics/ClassLength

class NavigateAroundAppEmployee < Base
  def set_employee
    leave_request_button = driver.find_element(css: '#tab-my-dashboard > div > div:nth-child(1) > div.card-footer > a')
    button_href = leave_request_button.property('href')
    button_href.split('/')[-3]
  end

  def navigate_to_dashboard_employee
    driver.navigate.to('https://hr.breathehrstaging.com/#tab-my-dashboard')
    # driver.find_element(css: 'href="/dashboard"').click
  end

  def navigate_to_profile_employee
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[2]/a').click
  end

  def navigate_to_my_profile_leave_requested
    driver.find_element(css: '#leave').click
    driver.find_element(css: '#tabs-0 > li:nth-child(1) > a').click
  end

  def navigate_to_my_profile_leave_booked
    driver.find_element(css: '#leave').click
    driver.find_element(css: '#tabs-0 > li:nth-child(2) > a').click
  end

  def navigate_to_company_dropdown_employee
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[3]/a').click
  end

  def navigate_to_calendar_employee
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[4]/a').click
  end

  def navigate_to_leave_request_widget
    driver.find_element(css: '#tab-my-dashboard > div > div:nth-child(1) > div.card-footer > a').click
  end

  # permissions employee testing methods
  def navigate_to_profile
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24848')
  end

  def edit_profile_summary
    driver.find_element(css: '#tab-summary > div.tab-actions > a > span >
      svg.svg-inline--fa.fa-pencil-alt.fa-w-16.fa-inverse.fa-stack-1x').click
    driver.find_element(id: 'employee_middle_name').send_keys 'Middle Name Editted'
    driver.find_element(css: '#edit-change-requests > p > input').click
  end

  # rubocop:disable Metrics/AbcSize
  def navigate_to_pay
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24848/pay_and_benefits#tab-pay')
    driver.find_element(css: 'body > section.content.container > div.employee-section-header > div > a').click
    driver.switch_to.window(driver.window_handles.last)
    driver.close
    driver.switch_to.window(driver.window_handles.first)
  end

  def navigate_to_benefits
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24848/pay_and_benefits#tab-benefits')
    driver.find_element(css: 'body > section.content.container > div.employee-section-header > div > a').click
    driver.switch_to.window(driver.window_handles.last)
    driver.close
    driver.switch_to.window(driver.window_handles.first)
  end

  def navigate_to_additional_payments
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24848/pay_and_benefits#tab-bonuses')
    driver.find_element(css: 'body > section.content.container > div.employee-section-header > div > a').click
    driver.switch_to.window(driver.window_handles.last)
    driver.close
    driver.switch_to.window(driver.window_handles.first)
  end
  # rubocop:enable Metrics/AbcSize

  def navigate_to_performance_onetoone
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24848/performance#one-to-ones')
  end

  def navigate_to_performance_objectives
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24848/performance#objectives')
  end

  def navigate_to_performance_deliverables
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24848/performance#deliverables')
  end

  def navigate_to_custom_fields
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24848#tab-custom')
  end

  def navigate_to_directory
    driver.navigate.to('https://hr.breathehrstaging.com/employees/directory')
    driver.find_element(id: 'health-and-safety').click
  end

  def navigate_to_calendar
    driver.navigate.to('https://hr.breathehrstaging.com/calendar')
    driver.find_element(css: '#calendar_dates > div > a.ml-2.next').click
  end

  def navigate_to_holidays
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24848/holidays')
  end

  # rubocop:disable Metrics/AbcSize
  def request_toil
    driver.execute_script("$('#toil').click()")
    driver.find_element(id: 'employee_holiday_year_adjustment_adjustment').send_keys '2'
    driver.find_element(id: '#employee_holiday_year_adjustment_earned_from_date_react').send_keys one_week_ago_string
    driver.find_element(id: '#employee_holiday_year_adjustment_earned_to_date_react').send_keys three_days_ago
    driver.find_element(id: 'employee_holiday_year_adjustment_reason').send_keys 'Test employee permissions'
    driver.find_element(css: '#new_employee_holiday_year_adjustment > div.modal-footer > input').click
  end
  # rubocop:enable Metrics/AbcSize

  def open_sickness_new
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24848/sicknesses/open')
  end

  def open_request_onetoeone_new
    driver.navigate.to('https://hr.breathehrstaging.com/employees/24848/one_to_one_requests/new')
  end

  def one_to_one_request
    driver.find_element(id: 'employee_one_to_one_request_company_one_to_one_type_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Half Year')
    # driver.find_element(id: 'employee_one_to_one_request_company_location_id')
    # choose = Selenium::WebDriver::Support::Select.new(drop)
    # choose.select_by(:text, '')
    driver.find_element(id: 'employee_one_to_one_request_summary').send_keys 'Added test to employee permissions'
    driver.find_element(css: '#new_employee_one_to_one_request > p > input').click
  end
end

# rubocop:enable Metrics/ClassLength
