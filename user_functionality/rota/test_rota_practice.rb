# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/ui_page_element_check_extension'
require './functions_library/test_reference_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/logout_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/rota_manager_extension'
require './functions_library/rota_employee_extension'
require './functions_library/timesheets_extension'
require './functions_library/timesheets_employee_extension'
require './settings'
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength

class Rota < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_rota
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    RotaExtension.new(@driver).assign_one_shift_monday_std_employee
    RotaExtension.new(@driver).share_shift
    RotaExtension.new(@driver).edit_shift_monday_std_employee
    RotaExtension.new(@driver).share_shift
    RotaExtension.new(@driver).delete_shift
    RotaExtension.new(@driver).assign_one_shift_monday_std_employee
    RotaExtension.new(@driver).share_shift
    RotaExtension.new(@driver).assign_multiple_shifts_std_employee
    sleep 1
    RotaExtension.new(@driver).share_shift
    RotaExtension.new(@driver).create_template
    RotaExtension.new(@driver).assign_template
    RotaExtension.new(@driver).share_shift
    RotaExtension.new(@driver).bulk_delete_shifts_employee
    sleep 2
    RotaExtension.new(@driver).bulk_delete_shifts_admin
    sleep 2
    RotaExtension.new(@driver).assign_template
    RotaExtension.new(@driver).share_shift
    sleep 5
    RotaExtension.new(@driver).delete_template
    LogoutExtension.new(driver).logout_admin
  end

  def employee
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_hr
    RotaEmpExtension.new(@driver).navigate_to_rota_from_hr
    begin
      RotaEmpExtension.new(@driver).employee_view_next_seven_days
      RotaEmpExtension.new(@driver).employee_check_assigned_rota_template
    rescue StandardError
      RotaEmpExtension.new(@driver).employee_view_next_thirty_days
      RotaEmpExtension.new(@driver).employee_check_assigned_rota_template
    end
    RotaEmpExtension.new(@driver).decline_shift
    RotaEmpExtension.new(@driver).swap_shift
    TimesheetEmpExtension.new(@driver).my_timesheets
    TimesheetEmpExtension.new(@driver).add_timesheet_pending_approval_employee
    LogoutExtension.new(driver).user_logout
  end

  def timesheets
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_hr
    sleep 1
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_daily_from_hr_admin
    TimesheetExtension.new(@driver).add_timesheet_to_employee
  end

  def employee_t
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_hr
    RotaEmpExtension.new(@driver).navigate_to_rota_from_hr
    TimesheetEmpExtension.new(@driver).add_timesheet_pending_approval_employee
  end

  it '4b line manager - approve on weekly view' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_line_manager
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_weekly_from_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).navigate_to_yesterday_lastweek
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).approve_weekly_view_timesheets
    sleep @sleep_time_long
  end

  it '4c line manager - edit on weekly view' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_line_manager
    LoginAppExtension.new(@driver).select_hr
    sleep @sleep_time_short
    TimesheetExtension.new(@driver).edit_timesheet_weekly_view
    sleep @sleep_time_long
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
# Rota.new.test_rota
# Rota.new.employee
Rota.new.timesheets
Rota.new.employee_t
