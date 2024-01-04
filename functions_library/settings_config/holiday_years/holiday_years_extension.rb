# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class HolidayYearExtension < Base
  # rubocop:disable Metrics/AbcSize
  def edit_holiday_years_now
    # change to tomorrow and change now
    driver.find_element(css: 'body > section.content.container.p-4 > div.float-right > a').click
    driver.find_element(id: '#new_start_date_react').clear
    driver.find_element(id: '#new_start_date_react').send_keys one_week_date_string
    driver.find_element(xpath: '/html/body/section/div/div/form/p/input').click
    driver.find_element(css: '#change_holiday_year_start > div > div > div.modal-footer
      > button.btn.btn-success.modal-confirm').click
    driver.find_element(css: 'body > section > div > div > div.breadcrumb > a').click
  end

  def complete_holiday_year
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[3]/td[3]/button').click
    driver.find_element(xpath: '//*[@id="finish_holiday_year_4416"]/div/div/div[3]/button[2]').click
  end
  # rubocop:enable Metrics/AbcSize
end
