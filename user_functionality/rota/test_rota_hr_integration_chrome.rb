# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require 'rspec'
require 'pry'
require './functions_library/ui_page_element_check_extension'
require './functions_library/test_reference_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/rota_manager_extension'
require './functions_library/rota_employee_extension'
require './functions_library/timesheets_extension'
require './functions_library/timesheets_employee_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/holiday_extension'
require './settings'
# rubocop:disable Metrics/BlockLength

RSpec.describe 'Timesheet Regression test script' do
  before do
    @sleep_time_long = (ENV['SLEEPTIME_LONG'] || 4).to_f
    @sleep_time_short = (ENV['SLEEPTIME_SMALL'] || 1).to_f
    options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--headless')
    # options.add_argument('--disable-gpu')
    # options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for :chrome, options:
  end

  # holidays
  it '1a. Employee holiday added to HR and seen in RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_add_holiday
    HolidayExtension.new(@driver).holiday_request_for_next_monday
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_rota_from_hr_admin
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep @sleep_time_short
    employee_shift_tomorrow = @driver.find_element(class: 'roster-map-2-0')
    shift_element = employee_shift_tomorrow.find_element(class: 'leave-card').split('>')[2].split('<')[2]
    expect(shift_element.attribute('innerHTML')).to eql('On Leave')
    sleep @sleep_time_short
    HolidayExtension.new(@driver).select_rota_employee_holiday_to_purge
    @driver.quit
  end

  it '1b. Employee holiday added to HR on a day where a rota is already present in RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
  end

  it '1c. Employee holiday added to a date and then a rota shift is then added to RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
  end

  # other leave
  it '2a. Employee other leave added to HR and seen in RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
  end

  it '2b. Employee other leave added to HR on a day where a rota is already present in RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
  end

  it '2c. Employee other leave added to a date and then a rota shift is then added to RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
  end

  # sickness
  it '3a. Employee sickness added to HR and seen in RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
  end

  it '3b. Employee sickness added to HR on a day where a rota is already present in RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
  end

  it '3c. Employee sickness added to a date and then a rota shift is then added to RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
  end

  # new employee
  it '4a. Add a new employee to HR which is sent to RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    AppNavigationExtensionManager.new(@driver).navigate_to_add_new_employee
    CreateEmployeeExtension.new(@driver).create_employee_pending_starter_from_people_page
  end

  it '4b. Change the employee department and job to another' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_short
  end

  it '4a Remove an employee from HR which is changed to left in RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
  end
  # rubocop:enable Metrics/BlockLength
end
