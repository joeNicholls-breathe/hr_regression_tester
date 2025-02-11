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
require './functions_library/other_leave_request_extension'
require './functions_library/sickness_extension'
require './functions_library/create_employee_extension'
require './functions_library/delete_employee_extension'
require './settings'

RSpec.describe 'Rota Regression negative test script' do
  before do
    @sleep_time_long = (ENV['SLEEPTIME_LONG'] || 4).to_f
    @sleep_time_short = (ENV['SLEEPTIME_SMALL'] || 1).to_f
    options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--headless')
    # options.add_argument('--disable-gpu')
    # options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for :chrome, options:
  end

  it '1a. Employee already has a shift for the date a second is attempted upon' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep @sleep_time_short
    RotaExtension.new(@driver).assign_one_shift_monday_std_employee
    sleep @sleep_time_long
    RotaExtension.new(@driver).share_shift
    sleep @sleep_time_long
    RotaExtension.new(@driver).assign_one_shift_monday_std_employee
    # rubocop:disable Layout/LineLength
    shift_element = @driver.find_element(xpath: '//*[@id="user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17"]/div/div[1]/div[2]')
    expect(shift_element.attribute('innerHTML')).to eql('Std Employee User is already working on February 17th 10:10 - 17:10.')
    # rubocop:enable Layout/LineLength
    sleep @sleep_time_short
    RotaExtension.new(@driver).delete_shift_with_leave
    sleep @sleep_time_short
    @driver.quit
  end
end
