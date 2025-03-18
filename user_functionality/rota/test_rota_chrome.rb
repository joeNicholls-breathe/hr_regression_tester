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

RSpec.describe 'Rota Regression test script' do
  before do
    @sleep_time_long = (ENV['SLEEPTIME_LONG'] || 4).to_f
    @sleep_time_short = (ENV['SLEEPTIME_SMALL'] || 1).to_f
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for :chrome, options:
  end

  # accessing Rota application
  puts 'Test 4a and 7a will fail but this is expected behaviour'

  it '1a. navigate to breathe login' do
    NavigateBrowserExtension.new(@driver).breathe_login
    expect(@driver.title).to eql('Log in to Breathe')
    @driver.quit
  end

  it '2a. RTA admin - login and navigate to ROTA via widget' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    expect(@driver.title).to eql('Rota, Time & Attendance')
    @driver.quit
  end

  it '2b. RTA admin - login and navigate to ROTA from hr' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep @sleep_time_long
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_rota_from_hr_admin
    sleep @sleep_time_long
    # expect(@driver.title).to eql('Rota, Time & Attendance')
    expect(@driver.title).to eql('Rota week view - user view')
    @driver.quit
  end

  it '3a. RTA employee - login and navigate to ROTA via widget' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_long
    expect(@driver.title).to eql('Employee dashboard | My Rosters')
    @driver.quit
  end

  it '3b. RTA employee - login and navigate to ROTA from hr' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    RotaEmpExtension.new(@driver).navigate_to_rota_from_hr
    sleep @sleep_time_long
    expect(@driver.title).to eql('Employee dashboard | My Rosters')
    @driver.quit
  end

  it '4a. RTA line manager - login and navigate to ROTA via widget' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_line_manager
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_long
    expect(@driver.title).to eql('Rota, Time & Attendance')
    # expect(@driver.title).to eql('Rota week view - user view')
    @driver.quit
  end

  it '4b. RTA line manager - login and navigate to ROTA from hr' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_line_manager
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_rota_from_hr_admin
    sleep @sleep_time_long
    # expect(@driver.title).to eql('Rota, Time & Attendance')
    expect(@driver.title).to eql('Rota week view - user view')
    @driver.quit
  end

  # shifts create/edit/cancel/delete/switch to an employee
  it '5a. assign and share shift to an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep @sleep_time_short
    RotaExtension.new(@driver).assign_one_shift_monday_std_employee
    sleep @sleep_time_long
    RotaExtension.new(@driver).share_shift
    sleep @sleep_time_long
    employee_monday_shift = @driver.find_element(class: 'roster-map-2-0')
    monday_shift_time_element = employee_monday_shift.find_element(class: 'shift-card-view__time')
    expect(monday_shift_time_element.attribute('innerHTML')).to eql('10:10-17:10')
    @driver.quit
  end

  it '5b. edit shift to an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep @sleep_time_long
    RotaExtension.new(@driver).edit_shift_monday_std_employee
    sleep @sleep_time_long
    RotaExtension.new(@driver).share_shift
    sleep @sleep_time_long
    employee_monday_shift = @driver.find_element(class: 'roster-map-2-0')
    monday_shift_time_element = employee_monday_shift.find_element(class: 'shift-card-view__time')
    expect(monday_shift_time_element.attribute('innerHTML')).to eql('08:30-16:30')
    @driver.quit
  end

  it '5c. delete single shift that was assigned to the employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep @sleep_time_long
    RotaExtension.new(@driver).delete_shift
    sleep @sleep_time_long
    @driver.find_element(css: '#user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    employee_monday_shift = @driver.find_element(class: 'roster-map-2-0')
    monday_shift_time_element = employee_monday_shift.find_element(class: 'elmo-input')
    expect(monday_shift_time_element.attribute('innerHTML')).to eql('')
    @driver.quit
  end

  it '5d. assign multiple shift to employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep @sleep_time_long
    RotaExtension.new(@driver).assign_multiple_shifts_std_employee
    sleep @sleep_time_long
    RotaExtension.new(@driver).share_shift
    sleep @sleep_time_long
    employee_monday_shift = @driver.find_element(class: 'roster-map-2-2')
    monday_shift_time_element = employee_monday_shift.find_element(class: 'shift-card-view__time')
    expect(monday_shift_time_element.attribute('innerHTML')).to eql('11:12-19:12')
    @driver.quit
  end

  # templates create/assign/edit/cancel/delete/switch to an employee
  it '6a. create a template for an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep @sleep_time_long
    RotaExtension.new(@driver).create_template
    sleep @sleep_time_short
    employee_monday_shift = @driver.find_element(class: 'roster-map-2-0')
    monday_shift_time_element = employee_monday_shift.find_element(class: 'shift-card-view__time')
    expect(monday_shift_time_element.attribute('innerHTML')).to eql('11:11-19:11')
    @driver.quit
  end

  it '6b. delete the template for an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_long
    RotaExtension.new(@driver).delete_template
    sleep @sleep_time_short
    RotaExtension.new(@driver).open_template_modal
    shift_template_still_present = @driver.find_element(id: 'template-name')
    expect(shift_template_still_present.attribute('innerHTML')).to eql('Employee Std Week1')
    @driver.quit
  end

  it '6c. assign a template for an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep @sleep_time_short
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep @sleep_time_short
    RotaExtension.new(@driver).assign_template
    sleep @sleep_time_long
    RotaExtension.new(@driver).share_shift
    sleep @sleep_time_long
    employee_monday_shift = @driver.find_element(class: 'roster-map-2-4')
    monday_shift_time_element = employee_monday_shift.find_element(class: 'shift-card-view__time')
    expect(monday_shift_time_element.attribute('innerHTML')).to eql('10:05-18:05')
    @driver.quit
  end

  # Employee tests
  # rubocop:disable Layout/LineLength
  it '7a. next 7 days of rota as employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    RotaEmpExtension.new(@driver).navigate_to_rota_from_hr
    sleep @sleep_time_short
    RotaEmpExtension.new(@driver).employee_view_next_seven_days
    sleep @sleep_time_long
    RotaEmpExtension.new(@driver).employee_check_assigned_rota_template
    sleep @sleep_time_long
    employee_rota_shift = @driver.find_element(css: 'span[data-testid=elmo-typography-default]')
    shift_time = employee_rota_shift.find_element(xpath: '//*[@id="root"]/div[1]/main/div[3]/div/div[2]/
      div/div/div[1]/div[2]/div/div[2]/div[1]/div[2]/div/div')
    expect(shift_time.attribute('innerHTML')).to eql('11:11 - 19:11<div id=\"brake-0\"><span data-testid=\"elmo-typography-default\" class=\"sc-htoDjs bZzhDu elmo-typography text-size-xs text-color-gray\">14:56 -&nbsp;15:26</span></div>')
    @driver.quit
  end
  # rubocop:enable Layout/LineLength

  it '7b. rota employee notification' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    sleep @sleep_time_short
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_short
    RotaEmpExtension.new(@driver).view_notifications_employee_shifts
    RotaEmpExtension.new(@driver).mark_all_as_read_and_delete
    RotaEmpExtension.new(@driver).close_notification_employee
    sleep @sleep_time_short
    @driver.quit
  end

  it '7c. decline/offer shift assigned to the employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_short
    RotaEmpExtension.new(@driver).employee_view_next_seven_days
    sleep @sleep_time_short
    RotaEmpExtension.new(@driver).decline_shift
    @driver.find_element(css: 'div[data-testid=badge-with-dropdown-info]').click
    element = @driver.find_element(css: 'svg[data-testid=CallMadeIcon]')
    expect(element).not_to be_nil
    @driver.quit
  end

  it '7d. swap shift assigned to the employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_short
    RotaEmpExtension.new(@driver).employee_view_next_thirty_days
    sleep @sleep_time_long
    RotaEmpExtension.new(@driver).swap_shift
    @driver.find_element(css: 'div[data-testid=badge-with-dropdown-info]').click
    element = @driver.find_element(css: 'svg[data-testid=SwapHorizOutlinedIcon]')
    expect(element).not_to be_nil
    @driver.quit
  end

  it '8a. erase all the shifts from the employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep @sleep_time_long
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep @sleep_time_long
    RotaExtension.new(@driver).bulk_delete_shifts_employee_with_swaps
    sleep @sleep_time_long
    RotaExtension.new(@driver).delete_shift
    sleep @sleep_time_long
    RotaExtension.new(@driver).delete_shift_wednesday
    sleep @sleep_time_long
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep @sleep_time_long
    RotaExtension.new(@driver).bulk_delete_shifts_employee
    sleep @sleep_time_long
    RotaExtension.new(@driver).bulk_delete_shifts_admin
    sleep @sleep_time_long
    @driver.find_element(css: '#user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    employee_monday_shift = @driver.find_element(class: 'roster-map-2-0')
    monday_shift_time_element = employee_monday_shift.find_element(class: 'elmo-input')
    expect(monday_shift_time_element.attribute('innerHTML')).to eql('')
    @driver.quit
  end
  # rubocop:enable Metrics/BlockLength
end
