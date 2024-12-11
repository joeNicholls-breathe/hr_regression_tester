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
    options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--headless')
    # options.add_argument('--disable-gpu')
    # options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for :chrome, options:
  end

  # accessing Rota application
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
    LoginAppExtension.new(@driver).select_hr
    sleep 0.5
    RotaExtension.new(@driver).navigate_to_rota_from_hr_admin
    expect(@driver.title).to eql('Rota, Time & Attendance')
    @driver.quit
  end

  it '2c. RTA admin - login and navigate to TIMESHEEET from hr' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_hr
    sleep 0.5
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_daily_from_hr_admin
    sleep 2
    expect(@driver.title).to eql('Timesheets')
    @driver.quit
  end

  it '3a. RTA employee - login and navigate to ROTA via widget' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_rota
    sleep 1.5
    expect(@driver.title).to eql('Employee dashboard | My Rosters')
    @driver.quit
  end

  it '3b. RTA employee - login and navigate to ROTA from hr' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_hr
    sleep 0.25
    RotaEmpExtension.new(@driver).navigate_to_rota_from_hr
    sleep 2
    expect(@driver.title).to eql('Employee dashboard | My Rosters')
    @driver.quit
  end

  it '4a. RTA line manager - login and navigate to ROTA via widget' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_line_manager
    LoginAppExtension.new(@driver).select_rota
    sleep 0.5
    expect(@driver.title).to eql('Rota, Time & Attendance')
    @driver.quit
  end

  it '4b. RTA line manager - login and navigate to ROTA from hr' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_line_manager
    LoginAppExtension.new(@driver).select_hr
    sleep 0.25
    RotaExtension.new(@driver).navigate_to_rota_from_hr_admin
    sleep 2
    expect(@driver.title).to eql('Rota week view - user view')
    @driver.quit
  end

  it '4c. RTA line manager - login and navigate to TIMESHEEET from hr' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_line_manager
    LoginAppExtension.new(@driver).select_hr
    sleep 0.25
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_daily_from_hr_admin
    sleep 2
    expect(@driver.title).to eql('Timesheets')
    @driver.quit
  end

  # shifts create/edit/cancel/delete/switch to an employee
  it '5a. assign and share shift to an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep 0.5
    RotaExtension.new(@driver).assign_one_shift_monday_std_employee
    RotaExtension.new(@driver).share_shift
    sleep 2
    employee_monday_shift = @driver.find_element(class: 'roster-map-2-0')
    monday_shift_time_element = employee_monday_shift.find_element(class: 'shift-card-view__time')
    expect(monday_shift_time_element.attribute('innerHTML')).to eql('10:10-17:10')
    @driver.quit
  end

  it '5b. edit shift to an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep 0.25
    RotaExtension.new(@driver).edit_shift_monday_std_employee
    RotaExtension.new(@driver).share_shift
    sleep 2
    employee_monday_shift = @driver.find_element(class: 'roster-map-2-0')
    monday_shift_time_element = employee_monday_shift.find_element(class: 'shift-card-view__time')
    expect(monday_shift_time_element.attribute('innerHTML')).to eql('08:30-16:30')
    @driver.quit
  end

  it '5c. delete single shift that was assigned to the employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep 1
    RotaExtension.new(@driver).delete_shift
    sleep 2
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
    sleep 0.25
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep 1
    RotaExtension.new(@driver).assign_multiple_shifts_std_employee
    sleep 1
    RotaExtension.new(@driver).share_shift
    sleep 2
    # employee_monday_shift = @driver.find_element(class: 'roster-map-1-0')
    # IF WE WANT TO CHECK THE TIME ENTERED ON WEDNESDAY INSTEAD
    employee_monday_shift = @driver.find_element(class: 'roster-map-2-2')
    monday_shift_time_element = employee_monday_shift.find_element(class: 'shift-card-view__time')
    # expect(monday_shift_time_element.attribute('innerHTML')).to eql('11:11-19:11')
    expect(monday_shift_time_element.attribute('innerHTML')).to eql('11:12-19:12')
    @driver.quit
  end

  # templates create/assign/edit/cancel/delete/switch to an employee
  it '6a. create a template for an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep 1
    RotaExtension.new(@driver).create_template
    # THERE IS AN ISSUE HERE AS THE AUTOMATION DOES NOT SAVE THE TEMPLATE
    # but will return to the same screen and forfil the expectation
    employee_monday_shift = @driver.find_element(class: 'roster-map-2-0')
    monday_shift_time_element = employee_monday_shift.find_element(class: 'shift-card-view__time')
    expect(monday_shift_time_element.attribute('innerHTML')).to eql('11:11-19:11')
    @driver.quit
  end

  it '6b. delete the template for an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaExtension.new(@driver).delete_template
    # THERE IS AN ISSUE HERE AS THE AUTOMATION DOES NOT DELETE THE TEMPLATE
    # Need to open up the tab again to check the template has been removed
    expect(@driver.title).to eql('Rota week view - user view')
    @driver.quit
  end

  it '6c. assign a template for an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep 1
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    sleep 1
    RotaExtension.new(@driver).assign_template
    sleep 6
    RotaExtension.new(@driver).share_shift
    sleep 3
    employee_monday_shift = @driver.find_element(class: 'roster-map-2-4')
    monday_shift_time_element = employee_monday_shift.find_element(class: 'shift-card-view__time')
    expect(monday_shift_time_element.attribute('innerHTML')).to eql('10:31-17:31')
    @driver.quit
  end

  # HERE
  # Employee tests
  it '7a. next 7 days of rota as employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_hr
    sleep 0.25
    RotaEmpExtension.new(@driver).navigate_to_rota_from_hr
    sleep 0.25
    RotaEmpExtension.new(@driver).employee_view_next_seven_days
    sleep 1
    RotaEmpExtension.new(@driver).employee_check_assigned_rota_template
    # NOT SURE I CAN EXPECT FROM THIS ELEMENT
    employee_rota_shift = @driver.find_element(class: 'jss5')
    shift_time = employee_rota_shift.find_element(class: 'elmo-col elmo-col-24 elmo-col-sm-12 elmo-col-md-6')
    expect(shift_time.attribute('innerHTML')).to eql('11:11-19:11')
    @driver.quit
  end

  it '7b. rota employee notification' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    sleep 0.25
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaEmpExtension.new(@driver).view_notifications_employee_shifts
    RotaEmpExtension.new(@driver).mark_all_as_read_and_delete
    RotaEmpExtension.new(@driver).close_notification_employee
    sleep 0.25
    puts '7b. complete'
    @driver.quit
  end

  it '7c. decline/offer shift assigned to the employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_rota
    sleep 1
    RotaEmpExtension.new(@driver).employee_view_next_seven_days
    RotaEmpExtension.new(@driver).decline_shift
    employee_shift_status = @driver.find_element(class: 'jss7')
    shift_status = employee_shift_status.find_element(class: 'MuiCardHeader-action css-1bh09gn')
    expect(shift_status.attribute('innerHTML')).to eql('Offered')
    @driver.quit
  end

  it '7d. swap shift assigned to the employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_rota
    sleep 1
    RotaEmpExtension.new(@driver).employee_view_next_thirty_days
    RotaEmpExtension.new(@driver).swap_shift
    employee_shift_status = @driver.find_element(class: 'jss7')
    # NEED TO FIND THE ELEMENT
    shift_status = employee_shift_status.find_element(class: 'MuiCardHeader-action css-1bh09gn')
    expect(shift_status.attribute('innerHTML')).to eql('Swapped')
    @driver.quit
  end

  it '8a. erase all the shifts from the employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep 1
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    puts 'next week'
    sleep 1
    RotaExtension.new(@driver).bulk_delete_shifts_employee
    sleep 2
    RotaExtension.new(@driver).delete_shift
    sleep 1
    RotaExtension.new(@driver).delete_shift_wednesday
    sleep 1
    RotaExtension.new(@driver).navigate_to_the_next_monday_shift
    puts 'two weeks time'    
    sleep 1
    RotaExtension.new(@driver).bulk_delete_shifts_employee
    sleep 2
    RotaExtension.new(@driver).bulk_delete_cancel_button
    sleep 0.5
    RotaExtension.new(@driver).bulk_delete_shifts_admin
    sleep 2
    RotaExtension.new(@driver).bulk_delete_cancel_button
    @driver.find_element(css: '#user-cell-0-roster-0-9d33f01a-3628-44d5-be40-36ffa17dcb17').click
    employee_monday_shift = @driver.find_element(class: 'roster-map-2-0')
    monday_shift_time_element = employee_monday_shift.find_element(class: 'elmo-input')
    expect(monday_shift_time_element.attribute('innerHTML')).to eql('')
    @driver.quit
  end
  # rubocop:enable Metrics/BlockLength
end
