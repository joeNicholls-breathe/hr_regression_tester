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
# rubocop:disable Metrics/BlockLength

RSpec.describe 'HR to Timesheets Regression test script' do
  before do
    @sleep_time_long = (ENV['SLEEPTIME_LONG'] || 4).to_f
    @sleep_time_short = (ENV['SLEEPTIME_SMALL'] || 2).to_f
    options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--headless')
    # options.add_argument('--disable-gpu')
    # options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for :chrome, options:
  end

  # WORK IN PROGRESS

  # holidays
  it '1a. Employee holiday added to HR and seen in Timesheets' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_add_holiday
    HolidayExtension.new(@driver).holiday_request_for_next_monday
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_weekly_from_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_tomorrow_nextweek
    sleep @sleep_time_short
    # rubocop:disable Layout/LineLength
    shift_element = @driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div[3]/div[3]/div/div[2]/div/div[1]')
    # rubocop:enable Layout/LineLength
    expect(shift_element.attribute('innerHTML')).to eql('On Leave')
    sleep @sleep_time_short
    HolidayExtension.new(@driver).select_rota_employee_holiday_to_purge
    sleep @sleep_time_short
    @driver.quit
  end

  it '1b. Employee holiday added to HR on a day where a rota is already present in RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_short
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep @sleep_time_short
    RotaExtension.new(@driver).assign_one_shift_monday_std_employee
    sleep @sleep_time_long
    RotaExtension.new(@driver).share_shift
    sleep @sleep_time_long
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_add_holiday
    HolidayExtension.new(@driver).holiday_request_for_next_monday
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_rota_from_hr_admin
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep @sleep_time_short
    # rubocop:disable Layout/LineLength
    shift_element = @driver.find_element(xpath: '//*[@id="user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17"]/div/div[1]/div[2]')
    # rubocop:enable Layout/LineLength
    expect(shift_element.attribute('innerHTML')).to eql('On Leave')
    sleep @sleep_time_short
    RotaExtension.new(@driver).delete_shift_with_leave
    sleep 5
    HolidayExtension.new(@driver).select_rota_employee_holiday_to_purge
    sleep @sleep_time_short
    @driver.quit
  end

  it '1c. Employee holiday added to a date and then a rota shift is then added to RTA' do
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
    RotaExtension.new(@driver).create_shift_with_leave
    warning_element = @driver.find_element(xpath: '//*[@id="shift-overlap-modal"]/div[3]/div/div[1]/p')
    expect(warning_element.attribute('innerHTML')).to eql('Shift is overlapped with user leave')
    RotaExtension.new(@driver).shift_with_leave_accept
    RotaExtension.new(@driver).share_shift
    sleep @sleep_time_long
    # rubocop:disable Layout/LineLength
    shift_element = @driver.find_element(xpath: '//*[@id="user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17"]/div/div[1]/div[2]')
    # rubocop:enable Layout/LineLength
    expect(shift_element.attribute('innerHTML')).to eql('On Leave')
    sleep @sleep_time_short
    RotaExtension.new(@driver).delete_shift_with_leave
    sleep 5
    HolidayExtension.new(@driver).select_rota_employee_holiday_to_purge
    sleep @sleep_time_short
    @driver.quit
  end

  # other leave
  it '2a. Employee other leave added to HR and seen in RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_add_holiday
    OtherLeaveRequestExtension.new(@driver).other_leave_request_for_next_monday
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_rota_from_hr_admin
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep @sleep_time_short
    # rubocop:disable Layout/LineLength
    shift_element = @driver.find_element(xpath: '//*[@id="user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17"]/div/div[1]/div[2]')
    # rubocop:enable Layout/LineLength
    expect(shift_element.attribute('innerHTML')).to eql('On Leave')
    sleep @sleep_time_short
    OtherLeaveRequestExtension.new(@driver).select_rota_employee_other_leave_to_purge
    sleep @sleep_time_short
    @driver.quit
  end

  it '2b. Employee other leave added to HR on a day where a rota is already present in RTA' do
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
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_add_holiday
    OtherLeaveRequestExtension.new(@driver).other_leave_request_for_next_monday
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_rota_from_hr_admin
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep @sleep_time_short
    # rubocop:disable Layout/LineLength
    shift_element = @driver.find_element(xpath: '//*[@id="user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17"]/div/div[1]/div[2]')
    # rubocop:enable Layout/LineLength
    expect(shift_element.attribute('innerHTML')).to eql('On Leave')
    sleep @sleep_time_short
    RotaExtension.new(@driver).delete_shift_with_leave
    sleep 5
    OtherLeaveRequestExtension.new(@driver).select_rota_employee_other_leave_to_purge
    sleep @sleep_time_short
  end

  it '2c. Employee other leave added to a date and then a rota shift is then added to RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_add_holiday
    OtherLeaveRequestExtension.new(@driver).other_leave_request_for_next_monday
    sleep @sleep_time_short
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_rota_from_hr_admin
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep @sleep_time_short
    RotaExtension.new(@driver).create_shift_with_leave
    sleep @sleep_time_long
    warning_element = @driver.find_element(xpath: '//*[@id="shift-overlap-modal"]/div[3]/div/div[1]/p')
    expect(warning_element.attribute('innerHTML')).to eql('Shift is overlapped with user leave')
    RotaExtension.new(@driver).shift_with_leave_accept
    sleep @sleep_time_short
    RotaExtension.new(@driver).share_shift
    sleep @sleep_time_long
    # rubocop:disable Layout/LineLength
    shift_element = @driver.find_element(xpath: '//*[@id="user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17"]/div/div[1]/div[2]')
    # rubocop:enable Layout/LineLength
    expect(shift_element.attribute('innerHTML')).to eql('On Leave')
    sleep @sleep_time_short
    RotaExtension.new(@driver).delete_shift_with_leave
    sleep 5
    # Delete other leave rather than holiday - Need to do??
    OtherLeaveRequestExtension.new(@driver).select_rota_employee_other_leave_to_purge
    sleep 4
    @driver.quit
  end

  # sickness
  it '3a. Employee sickness added to HR and seen in RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_add_sickness
    SicknessExtension.new(@driver).sickness_request_for_last_monday
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_rota_from_hr_admin
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_last_monday_shift
    sleep @sleep_time_long
    # rubocop:disable Layout/LineLength
    shift_element = @driver.find_element(xpath: '//*[@id="user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17"]/div/div[1]/div[2]')
    # rubocop:enable Layout/LineLength
    expect(shift_element.attribute('innerHTML')).to eql('Sickness')
    sleep @sleep_time_long
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_sickness
    sleep @sleep_time_short
    SicknessExtension.new(@driver).delete_sickness_record
    sleep @sleep_time_short
    @driver.quit
  end

  it '3b. Employee sickness added to HR on a day where a rota is already present in RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_last_monday_shift
    sleep @sleep_time_short
    RotaExtension.new(@driver).assign_one_shift_monday_std_employee
    sleep @sleep_time_long
    RotaExtension.new(@driver).share_shift
    sleep @sleep_time_long
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_add_sickness
    SicknessExtension.new(@driver).sickness_request_for_last_monday
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_rota_from_hr_admin
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_last_monday_shift
    sleep @sleep_time_short
    # rubocop:disable Layout/LineLength
    shift_element = @driver.find_element(xpath: '//*[@id="user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17"]/div/div[1]/div[2]')
    # rubocop:enable Layout/LineLength
    expect(shift_element.attribute('innerHTML')).to eql('Sickness')
    sleep @sleep_time_long
    RotaExtension.new(@driver).delete_shift_with_leave
    sleep 5
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_sickness
    sleep @sleep_time_short
    SicknessExtension.new(@driver).delete_sickness_record
    sleep @sleep_time_short
    @driver.quit
  end

  it '3c. Employee sickness added to a date and then a rota shift is then added to RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_add_sickness
    SicknessExtension.new(@driver).sickness_request_for_last_monday
    sleep @sleep_time_short
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_rota_from_hr_admin
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_last_monday_shift
    sleep @sleep_time_short
    RotaExtension.new(@driver).create_shift_with_leave # same action as sickness
    sleep @sleep_time_long
    warning_element = @driver.find_element(xpath: '//*[@id="shift-overlap-modal"]/div[3]/div/div[1]/p')
    expect(warning_element.attribute('innerHTML')).to eql('Shift is overlapped with user sickness')
    RotaExtension.new(@driver).shift_with_leave_accept # same action as sickness
    sleep @sleep_time_short
    RotaExtension.new(@driver).share_shift
    sleep @sleep_time_long
    # rubocop:disable Layout/LineLength
    shift_element = @driver.find_element(xpath: '//*[@id="user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17"]/div/div[1]/div[2]')
    # rubocop:enable Layout/LineLength
    expect(shift_element.attribute('innerHTML')).to eql('Sickness')
    sleep @sleep_time_long
    RotaExtension.new(@driver).delete_shift_with_leave
    sleep 5
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_sickness
    sleep @sleep_time_short
    SicknessExtension.new(@driver).delete_sickness_record
    sleep @sleep_time_short
    @driver.quit
  end
  # rubocop:enable Metrics/BlockLength
end
