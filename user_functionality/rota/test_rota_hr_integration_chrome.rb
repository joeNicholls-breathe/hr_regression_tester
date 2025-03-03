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

RSpec.describe 'HR to Rota Regression test script' do
  before do
    @sleep_time_long = (ENV['SLEEPTIME_LONG'] || 4).to_f
    @sleep_time_short = (ENV['SLEEPTIME_SMALL'] || 2).to_f
    options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--headless')
    # leaving head on, as i can not work out why it fail headless
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for :chrome, options:
  end

  # holidays
  it '1a. Employee holiday added to HR and seen in RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    AppNavigationExtensionManager.new(@driver).navigate_to_employee_holiday('26349')
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
    HolidayExtension.new(@driver).select_rota_employee_holiday_to_purge('Std Employee User')
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
    # RotaExtension.new(@driver).share_shift
    # sleep @sleep_time_long
    AppNavigationExtensionManager.new(@driver).navigate_to_employee_holiday('26349')
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
    HolidayExtension.new(@driver).select_rota_employee_holiday_to_purge('Std Employee User')
    sleep @sleep_time_long
    @driver.quit
  end

  it '1c. Employee holiday added to a date and then a rota shift is then added to RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    AppNavigationExtensionManager.new(@driver).navigate_to_employee_holiday('26349')
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
    # RotaExtension.new(@driver).share_shift
    sleep @sleep_time_long
    # rubocop:disable Layout/LineLength
    shift_element = @driver.find_element(xpath: '//*[@id="user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17"]/div/div[1]/div[2]')
    # rubocop:enable Layout/LineLength
    expect(shift_element.attribute('innerHTML')).to eql('On Leave')
    sleep @sleep_time_short
    RotaExtension.new(@driver).delete_shift_with_leave
    sleep 5
    HolidayExtension.new(@driver).select_rota_employee_holiday_to_purge('Std Employee User')
    sleep @sleep_time_long
    @driver.quit
  end

  # other leave
  it '2a. Employee other leave added to HR and seen in RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    AppNavigationExtensionManager.new(@driver).navigate_to_employee_holiday('26349')
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
    OtherLeaveRequestExtension.new(@driver).select_rota_employee_other_leave_to_purge('Std Employee User')
    sleep @sleep_time_long
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
    # RotaExtension.new(@driver).share_shift
    # sleep @sleep_time_long
    AppNavigationExtensionManager.new(@driver).navigate_to_employee_holiday('26349')
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
    OtherLeaveRequestExtension.new(@driver).select_rota_employee_other_leave_to_purge('Std Employee User')
    sleep @sleep_time_long
    @driver.quit
  end

  it '2c. Employee other leave added to a date and then a rota shift is then added to RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    AppNavigationExtensionManager.new(@driver).navigate_to_employee_holiday('26349')
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
    # sleep @sleep_time_short
    # RotaExtension.new(@driver).share_shift
    sleep @sleep_time_long
    # rubocop:disable Layout/LineLength
    shift_element = @driver.find_element(xpath: '//*[@id="user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17"]/div/div[1]/div[2]')
    # rubocop:enable Layout/LineLength
    expect(shift_element.attribute('innerHTML')).to eql('On Leave')
    sleep @sleep_time_short
    RotaExtension.new(@driver).delete_shift_with_leave
    sleep 5
    # Delete other leave rather than holiday - Need to do??
    OtherLeaveRequestExtension.new(@driver).select_rota_employee_other_leave_to_purge('Std Employee User')
    sleep @sleep_time_long
    @driver.quit
  end

  # sickness
  it '3a. Employee sickness added to HR and seen in RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_add_sickness('26349')
    SicknessExtension.new(@driver).sickness_request_for_last_monday
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_rota_from_hr_admin
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_last_monday_shift
    sleep 5
    # rubocop:disable Layout/LineLength
    shift_element = @driver.find_element(xpath: '//*[@id="user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17"]/div/div[1]/div[2]')
    # rubocop:enable Layout/LineLength
    expect(shift_element.attribute('innerHTML')).to eql('Sickness')
    sleep @sleep_time_long
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_sickness('26349')
    sleep @sleep_time_short
    SicknessExtension.new(@driver).delete_sickness_record
    sleep @sleep_time_long
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
    # RotaExtension.new(@driver).share_shift
    # sleep @sleep_time_long
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_add_sickness('26349')
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
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_sickness('26349')
    sleep @sleep_time_short
    SicknessExtension.new(@driver).delete_sickness_record
    sleep @sleep_time_long
    @driver.quit
  end

  it '3c. Employee sickness added to a date and then a rota shift is then added to RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_add_sickness('26349')
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
    # sleep @sleep_time_short
    # RotaExtension.new(@driver).share_shift
    sleep @sleep_time_long
    # rubocop:disable Layout/LineLength
    shift_element = @driver.find_element(xpath: '//*[@id="user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17"]/div/div[1]/div[2]')
    # rubocop:enable Layout/LineLength
    expect(shift_element.attribute('innerHTML')).to eql('Sickness')
    sleep @sleep_time_long
    RotaExtension.new(@driver).delete_shift_with_leave
    sleep 5
    AppNavigationExtensionManager.new(@driver).navigate_to_rota_employee_sickness('26349')
    sleep @sleep_time_short
    SicknessExtension.new(@driver).delete_sickness_record
    sleep @sleep_time_long
    @driver.quit
  end

  # new employee
  it '4a. Add a new employee to HR which is sent to RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_admin
    sleep @sleep_time_short
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    AppNavigationExtensionManager.new(@driver).navigate_to_add_new_employee
    CreateEmployeeExtension.new(@driver).create_employee_rota
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_rota_employees_people
    sleep @sleep_time_short
    RotaExtension.new(@driver).search_employee_on_people_page
    sleep @sleep_time_short
    # rubocop:disable Layout/LineLength
    new_employee_present = @driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div/div[2]/div[2]/div/div[1]/div[2]/div/div[1]')
    # rubocop:enable Layout/LineLength
    sleep @sleep_time_short
    expect(new_employee_present.attribute('innerHTML')).to eql('Newemployee User')
    sleep @sleep_time_short
    @driver.quit
  end

  it '4b. Change the employee department and job to another' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_rota_employees_people
    sleep @sleep_time_short
    RotaExtension.new(@driver).search_employee_on_people_page
    sleep @sleep_time_short
    RotaExtension.new(@driver).select_employee
    sleep 4
    RotaExtension.new(@driver).edit_employee_details
    sleep 3
    RotaExtension.new(@driver).change_primary_job
    sleep 3
    RotaExtension.new(@driver).return_to_people_index
    sleep @sleep_time_short
    RotaExtension.new(@driver).search_employee_on_people_page
    sleep @sleep_time_short
    # rubocop:disable Layout/LineLength
    new_employee_present = @driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div/div[2]/div[2]/div/div[3]/div[2]')
    # rubocop:enable Layout/LineLength
    sleep @sleep_time_short
    expect(new_employee_present.attribute('innerHTML')).to eql('line manager - Logistics, Regression Account')
    @driver.quit
  end

  it '4c Remove an employee from HR which is changed to left in RTA' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    AppNavigationExtensionManager.new(@driver).search_employee_newemployeeuser
    sleep 4
    DeleteEmployeeExtension.new(@driver).delete_employee
    sleep 2
    RotaExtension.new(@driver).navigate_to_rota_employees_people
    RotaExtension.new(@driver).search_employee_on_people_page
    sleep @sleep_time_short
    new_employee_present = @driver.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div/div/div/h3')
    sleep @sleep_time_short
    expect(new_employee_present.attribute('innerHTML')).to eql('Your search did not match any user names.')
    @driver.quit
  end
  # rubocop:enable Metrics/BlockLength
end
