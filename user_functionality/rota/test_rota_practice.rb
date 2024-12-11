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
    # ON THE SAVE OF THE TEMPLATE WE HAVE AN ISSUE THAT IT DOESNT SAVE FROM
    # THE AUTOMATION ALTHOUGH IS FINE FROM MANUAL, SAME ISSUE ABOVE WITH MANUAL
    # CHANGE WORKS FINE
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
    # DELETE WONT REMOVE THE PREVIOUS TEMPLATE FOR SOME REASON - AS SOON AS A SHIFT
    # IS SAVED THEN THIS IS FOREVER IN THE DB BUT IS REMOVED FROM THE FE
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
    TimesheetExtension.new(@driver).navigate_to_timeandattendance_daily_from_hr_admin
  end

  def remove_test_data
    # this will be to remove all data from the employee
    # so we can run this again on the next run as this will be run three times a day
    # bulk delete shifts
  end
end

# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength

# Rota.new.test_rota
Rota.new.employee
Rota.new.timesheets
Rota.new.remove_test_data
