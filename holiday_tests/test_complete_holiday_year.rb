# frozen_string_literal: true

require 'selenium-webdriver'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/logout_extension'
require './functions_library/login_app_extension'
require './functions_library/settings_config/holiday_years/holiday_years_extension'
require './functions_library/navigate_around_app_manager'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class CompleteHolidayYear
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  # this will complete the holiday year for the year before
  # running this test will only need to be done once a year
  # and will need to be done before running other absence tests
  # if this is not completed the totals in the other tests will be wrong

  def test_complete_holiday_year
    puts 'Running - test_complete_holiday_year.rb'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_admin
    puts 'Pass - Login as admin'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Pass - Selects HR'
    sleep 1
    AppNavigationExtensionManager.new(driver).navigate_to_holiday_years
    puts 'Pass - navigates to holiday years'
    HolidayYearExtension.new(driver).complete_holiday_year
    puts 'Pass - completed holiday year'
    sleep 1
    puts 'Complete - test_complete_holiday_year.rb'
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

CompleteHolidayYear.new.test_complete_holiday_year
