# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class HolidayYearExtension < Base
  def edit_holiday_years_now
    # change to tomorrow and change now
    driver.find_element(xpath: '/html/body/section[2]/div[2]/a/span/svg[2]').click
    driver.find_element(id: '#new_start_date_react').send_keys tomorrow
    driver.find_element(xpath: '/html/body/section/div/div/form/p/input').click
  end
end
