# frozen_string_literal: true

require 'selenium-webdriver'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/logout_extension'
require './functions_library/login_app_extension'
require './functions_library/settings_config/holiday_years/holiday_years_extension'
require './functions_library/holiday_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/people_page_extension'

# rubocop:disable Metrics/AbcSize
class EditHolidayYear
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def change_start_date
    puts 'Starting Test Edit Holiday Year'
    find_current_start
  end

  def execute(holiday_route)
    check_employee_daily(holiday_route)
    check_employee_hourly(holiday_route)
    check_employee_positive_carryover(holiday_route)
    check_employee_negative_carryover(holiday_route)
    puts 'Test Complete Edit Holiday Year'
    driver.quit
  end

  def find_current_start # rubocop:disable Metrics/MethodLength
    puts 'Running - test_complete_holiday_year.rb'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'PASS - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_holiday_year_end
    puts 'PASS - Login as admin'
    LoginAppExtension.new(driver).select_hr
    puts 'PASS - Selects HR'
    sleep 1
    AppNavigationExtensionManager.new(driver).navigate_to_holiday_years
    puts 'PASS - navigates to holiday years'
    sleep 1
    current_start = HolidayYearExtension.new(driver).find_current_start_date
    puts "Current start is #{current_start} changing now"
    if current_start.include? '01/01'
      change_holiday_start_date('a')
    elsif current_start.include? '31/01'
      change_holiday_start_date('b')
    end
  end

  def change_holiday_start_date(holiday_route) # rubocop:disable Metrics/MethodLength
    HolidayYearExtension.new(driver).open_edit_holiday_year
    puts 'PASS - Edit holiday year opened'
    HolidayYearExtension.new(driver).open_holiday_year_calendar
    puts 'PASS - Calendar Opened'
    HolidayYearExtension.new(driver).change_holiday_start_date(holiday_route)
    puts 'PASS - Date Entered'
    puts 'PASS - Click Change Holiday Year'
    driver.find_element(class: 'btn-success').click
    puts 'PASS - Change Confirmed'
    driver.find_element(class: 'modal-confirm').click
    sleep 1
    HolidayYearExtension.new(driver).back_to_holiday_years_breadcrumb
    sleep 1
    HolidayYearExtension.new(driver).calculate_carryover
    execute(holiday_route)
  end

  def check_employee_daily(holiday_route)
    sleep 1
    AppNavigationExtensionManager.new(driver).navigate_to_people_list
    puts 'PASS - People List Opened'
    PeoplePageExtension.new(driver).select_employee_from_list('EmployeeA year-end')
    puts 'PASS - Daily Employee Opened'
    AppNavigationExtensionManager.new(driver).open_employee_leave
    sleep 1
    HolidayExtension.new(driver).compare_holiday_allowance('19') if holiday_route == 'b'
    HolidayExtension.new(driver).compare_holiday_allowance('20') if holiday_route == 'a'
  end

  def check_employee_hourly(holiday_route)
    sleep 1
    AppNavigationExtensionManager.new(driver).navigate_to_people_list
    puts 'PASS - People List Opened'
    PeoplePageExtension.new(driver).select_employee_from_list('EmployeeB year-end')
    puts 'PASS - Hourly Employee Opened'
    AppNavigationExtensionManager.new(driver).open_employee_leave
    sleep 1
    HolidayExtension.new(driver).compare_holiday_allowance('92h 30m') if holiday_route == 'b'
    HolidayExtension.new(driver).compare_holiday_allowance('100h') if holiday_route == 'a'
  end

  def check_employee_positive_carryover(holiday_route)
    sleep 1
    AppNavigationExtensionManager.new(driver).navigate_to_people_list
    puts 'PASS - People List Opened'
    PeoplePageExtension.new(driver).select_employee_from_list('EmployeeC year-end')
    puts 'PASS - Positive Carryover Employee Opened'
    AppNavigationExtensionManager.new(driver).open_employee_leave
    sleep 1
    HolidayExtension.new(driver).compare_holiday_carried_daily('5.0') if holiday_route == 'b'
    HolidayExtension.new(driver).compare_holiday_carried_daily('2.0') if holiday_route == 'a'
  end

  def check_employee_negative_carryover(holiday_route)
    sleep 1
    AppNavigationExtensionManager.new(driver).navigate_to_people_list
    puts 'PASS - People List Opened'
    PeoplePageExtension.new(driver).select_employee_from_list('EmployeeD year-end')
    puts 'PASS - Hourly Employee Opened'
    AppNavigationExtensionManager.new(driver).open_employee_leave
    sleep 1
    HolidayExtension.new(driver).compare_negative_allowance('2h 30m') if holiday_route == 'a'
    HolidayExtension.new(driver).compare_holiday_used_from_next_year('2h 30m') if holiday_route == 'b'
  end
  # rubocop:enable Metrics/AbcSize
end

EditHolidayYear.new.change_start_date
