# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/ui_page_element_check'
require './functions_library/test_reference_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/logout_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/rota_extension'
require './settings'
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/LineLength

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
    # HAVING ISSUES AMENDING THE DATES OF A SHIFT AS ONCE YOU CLEAR THE CELL/FIELD THE ORIGINAL
    # NUMBER FOR START AND FINISH TIME SOMEHOW IS STILL CACHED IN THE COMMAND
    # RotaExtension.new(@driver).edit_shift_monday_std_employee
    # RotaExtension.new(@driver).share_shift
    RotaExtension.new(@driver).delete_shift
    RotaExtension.new(@driver).assign_one_shift_monday_std_employee
    RotaExtension.new(@driver).share_shift
    RotaExtension.new(@driver).assign_multiple_shifts_std_employee
    sleep 1
    RotaExtension.new(@driver).share_shift
    # ON THE SAVE OF THE TEMPLATE WE HAVE AN ISSUE THAT IT DOESNT SAVE FROM THE AUTOMATION ALTHOUGH
    # IS FINE FROM MANUAL SAME ISSUE ABOVE WITH MANUAL CHANGE WORKS FINE
    RotaExtension.new(@driver).create_template
    RotaExtension.new(@driver).assign_template
    RotaExtension.new(@driver).share_shift
    # DELETE WONT REMOVE THE PREVIOUS TEMPLATE FOR SOME REASON
    RotaExtension.new(@driver).delete_template
    LogoutExtension.new(driver).logout_admin
    # employee
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_employee
    LoginAppExtension.new(@driver).select_hr
    RotaExtension.new(@driver).my_employee_dashboard_rota
    RotaExtension.new(@driver).employee_view_next_seven_days
    # CURRENT POSITION
    RotaExtension.new(@driver).employee_check_assigned_rota_template # need to make sure template is with 30 days or today
    RotaExtension.new(@driver).view_notifications_employee_shifts
    RotaExtension.new(@driver).decline_shift
    RotaExtension.new(@driver).swap_shift
    LogoutExtension.new(driver).user_logout
  end

  def timesheets
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_hr
    RotaExtension.new(@driver).navigate_to_timeandattendance_daily_from_hr_admin
  end
end

# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/LineLength
Rota.new.test_rota
