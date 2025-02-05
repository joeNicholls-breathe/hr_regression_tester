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
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_daily_from_hr
    sleep @sleep_time_long
    expect(@driver.title).to eql('Timesheets')
    @driver.quit
  end

  it '1b. RTA line manager - login and navigate to TIMESHEEET from hr' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_line_manager
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_daily_from_hr
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
    sleep @sleep_time_long
    expect(@driver.title).to eql('Employee dashboard | My Timesheet')
    @driver.quit
  end

  it '2a admin user - adds timesheet to employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_daily_from_hr
    TimesheetExtension.new(@driver).add_timesheet_to_employee_today
    sleep @sleep_time_long
    # rubocop:disable Layout/LineLength
    employee_timesheet = @driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div[2]/div/div/div[2]/div[1]/div[2]/div/div')
    # rubocop:enable Layout/LineLength
    timesheet_start_time = employee_timesheet.attribute('innerHTML').split('>')[1].split('<')[0]
    expect(timesheet_start_time).to eql('12:01')
    @driver.quit
  end

  it '2b line manager user - adds timesheet to employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_line_manager
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_daily_from_hr
    TimesheetExtension.new(@driver).navigate_to_yesterday_lastweek
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).add_timesheet_to_employee_yesterday
    sleep @sleep_time_long
    # rubocop:disable Layout/LineLength
    employee_timesheet = @driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div[2]/div/div/div[2]/div[1]/div[2]/div/div')
    # rubocop:enable Layout/LineLength
    timesheet_start_time = employee_timesheet.attribute('innerHTML').split('>')[1].split('<')[0]
    expect(timesheet_start_time).to eql('13:02')
    @driver.quit
  end

  it '2c employee - add timesheet to self' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_hr
    RotaEmpExtension.new(@driver).navigate_to_rota_from_hr
    TimesheetEmpExtension.new(@driver).my_timesheets
    TimesheetEmpExtension.new(@driver).add_timesheet_pending_approval_employee_last_week
    sleep @sleep_time_long
    TimesheetEmpExtension.new(@driver).last_six_months
    # rubocop:disable Layout/LineLength
    employee_timesheet = @driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div[2]/div/div/div[2]/div[1]/div/div[1]/div[2]/div/div[2]')
    # rubocop:enable Layout/LineLength
    sleep @sleep_time_long
    timesheet_times = employee_timesheet.attribute('innerHTML')
    expect(timesheet_times).to eql('09:03 - 17:03')
    @driver.quit
  end

  it '3a admin user - appoves timesheet for employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_daily_from_hr
    TimesheetExtension.new(@driver).approve_timesheet
    sleep @sleep_time_long
    # rubocop:disable Layout/LineLength
    employee_timesheet = @driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div[2]/div/div/div[1]/div[3]/div/div/span')
    # rubocop:enable Layout/LineLength
    timesheet_approved = employee_timesheet.attribute('innerHTML')
    expect(timesheet_approved).to eql('Approved')
    @driver.quit
  end

  it '3b admin user - edit timesheet for employee yesterday' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_daily_from_hr
    TimesheetExtension.new(@driver).navigate_to_yesterday_lastweek
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).edit_timesheet_on_daily
    sleep @sleep_time_long
    # rubocop:disable Layout/LineLength
    employee_timesheet = @driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div[2]/div/div/div[2]/div[1]/div[2]/div/div')
    # rubocop:enable Layout/LineLength
    timesheet_start_time = employee_timesheet.attribute('innerHTML').split('>')[1].split('<')[0]
    expect(timesheet_start_time).to eql('10:15')
    @driver.quit
  end

  it '3c admin user - removes timesheet for employee today' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_daily_from_hr
    TimesheetExtension.new(@driver).remove_timesheet_daily
    sleep @sleep_time_long
    banner = @driver.find_element(class: 'elmo-message-block__header')
    employee_timesheet = banner.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div[2]/div/div/div')
    timesheet_banner = employee_timesheet.attribute('innerHTML').split('>')[1].split('<')[0]
    expect(timesheet_banner).to eql('No shifts were found matching your filter.')
    @driver.quit
  end

  it '4a line manager - create timesheet for employee on weekly view' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_line_manager
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_weekly_from_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_yesterday_lastweek
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).add_timesheet_weekly_view
    sleep @sleep_time_long
    employee_timesheet = @driver.find_element(css: 'p[data-testid=timesheet-time]')
    timesheet_start_and_end_time = employee_timesheet.attribute('innerHTML')
    expect(timesheet_start_and_end_time).to eql('11:04 - 19:04')
    @driver.quit
  end

  it '4b line manager - bulk approve on weekly view' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_line_manager
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_weekly_from_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).bulk_approve
    sleep @sleep_time_long
    TimesheetExtension.new(@driver).navigate_to_yesterday_lastweek
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).bulk_approve
    sleep @sleep_time_long
    timesheet_approved = @driver.find_element(css: 'svg[data-testid=CheckCircleOutlinedIcon]')
    timesheet_approved.displayed?
    @driver.quit
  end

  it '5a employee - review approved timesheet and notification' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_hr
    RotaEmpExtension.new(@driver).navigate_to_rota_from_hr
    TimesheetEmpExtension.new(@driver).my_timesheets
    TimesheetEmpExtension.new(@driver).last_six_months
    sleep @sleep_time_short
    TimesheetEmpExtension.new(@driver).approved_only_timesheet
    sleep @sleep_time_long
    # rubocop:disable Layout/LineLength
    employee_timesheet = @driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div[2]/div/div/div[2]/div[1]/div/div[2]/div[2]/div/span')
    # rubocop:enable Layout/LineLength
    timesheet_approved_only = employee_timesheet.attribute('innerHTML')
    expect(timesheet_approved_only).to eql('Approved')
    @driver.quit
  end

  it '6a line manager - bulk remove on weekly view' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_line_manager
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_weekly_from_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).bulk_remove
    sleep @sleep_time_long
    TimesheetExtension.new(@driver).navigate_to_yesterday_lastweek
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).bulk_remove
    sleep @sleep_time_long
    TimesheetExtension.new(@driver).navigate_to_yesterday_lastweek
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).bulk_remove
    sleep @sleep_time_long
    TimesheetExtension.new(@driver).navigate_to_yesterday_lastweek
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).bulk_remove
    sleep @sleep_time_long
  end
  # rubocop:enable Metrics/BlockLength
end
