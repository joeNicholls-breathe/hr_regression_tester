# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require 'rspec'
require 'pry'
require './functions_library/ui_page_element_check'
require './functions_library/test_reference_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/rota_extension'
require './settings'
# rubocop:disable Metrics/BlockLength

RSpec.describe 'Rota Regression test script' do
  before do
    options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--headless')
    # options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for :chrome, options:
  end

  # accessing Rota application
  it '1a. navigate to breathe user login' do
    NavigateBrowserExtension.new(@driver).breathe_login
    expect(@driver.title).to eql('Log in to Breathe')
  end

  it '1b. login as rota admin user via RTA widget' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep 0.25
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    expect(@driver.title).to eql('Rota, Time & Attendance')
  end

  it '1c. navigate to rota from hr as admin user' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep 0.25
    LoginAppExtension.new(@driver).select_hr
    sleep 0.25
    RotaExtension.new(@driver).navigate_to_rota_from_hr_admin
    expect(@driver.title).to eql('Rota, Time & Attendance')
  end

  it '1d. navigate to timesheets from hr as admin user' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    sleep 0.25
    LoginAppExtension.new(@driver).select_hr
    sleep 0.25
    RotaExtension.new(@driver).navigate_to_timeandattendance_daily_from_hr_admin
    sleep 2
    expect(@driver.title).to eql('Timesheets')
  end

  it '1e. navigate to rota as employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_rota
    sleep 1
    expect(@driver.title).to eql('Rota, Time & Attendance')
  end

  it '1f. navigate to rota as employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_hr
    sleep 0.25
    RotaExtension.new(@driver).my_employee_dashboard_rota
    sleep 1
    expect(@driver.title).to eql('Employee dashboard | My Rosters')
  end

  it '1g. next 7 days of rota as employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_hr
    sleep 0.25
    RotaExtension.new(@driver).my_employee_dashboard_rota
    sleep 0.25
    RotaExtension.new(@driver).employee_view_next_seven_days
    sleep 1
    RotaExtension.new(@driver).employee_check_assigned_rota_template
    expect(@driver.title).to eql('Employee dashboard | My Rosters')
  end

  # shifts create/edit/cancel/delete/switch to an employee
  it '2a. assign and share shift to an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaExtension.new(@driver).assign_one_shift_monday_std_employee
    sleep 1
    RotaExtension.new(@driver).share_shift
    sleep 2
    employee_monday_shift = @driver.find_element(class: 'roster-map-1-0')
    monday_shift_time_element = employee_monday_shift.find_element(class: 'shift-card-view__time')
    expect(monday_shift_time_element.attribute('innerHTML')).to eql('10:12-17:13')
  end

  it '2b. edit shift to an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaExtension.new(@driver).edit_shift
    sleep 1
    RotaExtension.new(@driver).share_shift
    sleep 2
    employee_monday_shift = @driver.find_element(class: 'roster-map-1-0')
    monday_shift_time_element = employee_monday_shift.find_element(class: 'shift-card-view__time')
    expect(monday_shift_time_element.attribute('innerHTML')).to eql('08:00-16:30')
  end

  it '2c. delete shift that was assigned to the employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaExtension.new(@driver).delete_shift
  end

  it '2d. rota employee notification' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    sleep 0.25
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaExtension.new(@driver).employee_view_next_seven_days
    sleep 0.25
    RotaExtension.new(@driver).view_notifications_employee_shifts
    expect(@driver.title).to eql('Employee dashboard | My Rosters')
  end

  it '2e. decline shift assigned to the employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaExtension.new(@driver).employee_view_next_seven_days
    RotaExtension.new(@driver).decline_shift
  end

  it '2f. swap shift assigned to the employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaExtension.new(@driver).employee_view_next_seven_days
    RotaExtension.new(@driver).swap_shift
  end

  # templates create/assign/edit/cancel/delete/switch to an employee
  it '3a. create a template for an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaExtension.new(@driver).create_template
    expect(@driver.title).to eql('Rota week view - user view')
  end

  it '3b. delete a template for an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaExtension.new(@driver).delete_template
    expect(@driver.title).to eql('Rota week view - user view')
  end

  it '3c. assign a template for an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    expect(@driver.title).to eql('Rota week view - user view')
  end
  # rubocop:enable Metrics/BlockLength
end
