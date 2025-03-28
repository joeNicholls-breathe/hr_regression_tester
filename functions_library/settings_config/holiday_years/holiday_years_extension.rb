# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class HolidayYearExtension < Base
  # rubocop:disable Metrics/AbcSize
  def edit_holiday_years_now
    # change to next week time
    driver.find_element(xpath: '/html/body/div[3]/div/section/div[2]/a').click
    sleep 1
    driver.find_element(id: '#holiday_year_start_form_new_start_date_react').clear
    driver.find_element(id: '#holiday_year_start_form_new_start_date_react').send_keys one_week_date_string
    driver.find_element(xpath: '/html/body/section/div/div/form/p/input').click
    sleep 1
    driver.find_element(xpath: '//*[@id="change_holiday_year_start_modal"]/div/div/div[3]/button[2]').click
    sleep 1
    driver.find_element(css: 'body > section > div > div > div.breadcrumb > a').click
  end

  def complete_holiday_year
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[3]/td[3]/button').click
    driver.find_element(xpath: '//*[@id="finish_holiday_year_4416"]/div/div/div[3]/button[2]').click
  end

  def open_edit_holiday_year
    driver.find_element(
      css: 'body > div.hr-main-container > div > section > div.float-right > a > span > svg.svg-inline--fa.fa-pencil-alt.fa-w-16.fa-inverse.fa-stack-1x > path' # rubocop:disable Layout/LineLength
    ).click
  end

  def open_holiday_year_calendar
    driver.find_element(class: 'DateInput_input').click
  end

  def change_holiday_start_date(holiday_route)
    calendar = driver.find_element(class: 'DateInput_input')
    calendar.clear
    if holiday_route == 'a'
      calendar.send_keys '31/01/2025'
    elsif holiday_route == 'b'
      calendar.send_keys '01/01/2025'
    end
  end

  def back_to_holiday_years_breadcrumb
    driver.find_element(css: 'body > section > div > div > div.breadcrumb > a > svg').click
  end

  def find_current_start_date
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.align-middle.sorting_1').text
  end

  def calculate_carryover
    button = driver.find_element(class: 'finish-year')
    attribute_value = button.attribute('outerHTML')
    match = attribute_value.match(/finish_holiday_year_(\d+)/)
    extracted_num = match[1]
    button.click
    frame = driver.find_element(id: "finish_holiday_year_#{extracted_num}")
    frame.find_element(class: 'modal-confirm').click
  end
end
# rubocop:enable Metrics/AbcSize
