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

  # accessing Timesheet application as users
  it '1a. RTA admin - login and navigate to TIMESHEEET from hr' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_daily_from_hr_admin
    sleep @sleep_time_long
    expect(@driver.title).to eql('Timesheets')
    @driver.quit
  end

  it '1b. RTA line manager - login and navigate to TIMESHEEET from hr' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_line_manager
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_daily_from_hr_admin
    sleep @sleep_time_long
    expect(@driver.title).to eql('Timesheets')
    @driver.quit
  end

  it '1c. RTA employee - login and navigate to TIMESHEEET from hr' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_hr
    RotaEmpExtension.new(@driver).navigate_to_rota_from_hr
    TimesheetEmpExtension.new(@driver).my_timesheets
    expect(@driver.title).to eql('Employee dashboard | My Timesheet')
    @driver.quit
  end

  it '2a admin user - adds timesheet to employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_daily_from_hr_admin
    TimesheetExtension.new(@driver).add_timesheet_to_employee
    # today
    employee_timesheet_today = @driver.find_element(class: 'card-header-options')
    timesheet_element = employee_timesheet_today.find_element(class: 'MuiChip-label MuiChip-labelSmall css-tavflp')
    expect(timesheet_element.attribute('innerHTML')).to eql('Pending')
  end

  it '3a admin user - appoves timesheet for empployee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_daily_from_hr_admin
    TimesheetExtension.new(@driver).add_timesheet_pending_approval_manager # today? will need to change
  end

  it '4a employee - add timesheet to self' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_hr
    RotaEmpExtension.new(@driver).navigate_to_rota_from_hr
    TimesheetEmpExtension.new(@driver).my_timesheets
    TimesheetEmpExtension.new(@driver).add_timesheet_pending_approval_employee # 2 weeks today?
  end
  # rubocop:enable Metrics/BlockLength
end
