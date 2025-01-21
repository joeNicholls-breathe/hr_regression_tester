# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class HolidayYearExtension < Base
  # rubocop:disable Metrics/AbcSize
  def edit_holiday_years_now
    # change to next week time
    driver.find_element(xpath: '/html/body/div[3]/div/section/div[2]/a').click
    driver.find_element(id: '#new_start_date_react').clear
    driver.find_element(id: '#new_start_date_react').send_keys one_week_date_string
    driver.find_element(xpath: '/html/body/section/div/div/form/p/input').click
    driver.find_element(xpath: '//*[@id="change_holiday_year_start_modal"]/div/div/div[3]/button[2]').click
    driver.find_element(css: 'body > section > div > div > div.breadcrumb > a').click
  end

  def complete_holiday_year
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[3]/td[3]/button').click
    driver.find_element(xpath: '//*[@id="finish_holiday_year_4416"]/div/div/div[3]/button[2]').click
  end
  # rubocop:enable Metrics/AbcSize
end
