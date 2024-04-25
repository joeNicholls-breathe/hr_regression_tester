# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/ui_page_element_check'
require './functions_library/test_reference_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_lm'
require './functions_library/leave_request_extension'
require './functions_library/holiday_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class LMUserDeleteAccess < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_1006g_lm_delete_permisssions
    # Employee login and request holiday
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).login_setup_acc_lm_employee_user
    LoginAppExtension.new(driver).select_hr
    p '1a - employee - login'
    HolidayExtension.new(driver).holiday_request_dashboard_navigate_employee
    LeaveRequestExtension.new(driver).employee_holiday_leave_request_one
    p '1b - employee - holiday leave request'
    # might want to add more items to delete from user they i wont have to clear from other user - might be cleaner
    sleep 1
    AppNavigationExtensionLM.new(driver).lm_logout
    puts '1. Request leave as Employees, employee - Pass'
    sleep 0.50
    # Line Manager (LM) Login
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).login_setup_acc_line_manager_user
    LoginAppExtension.new(driver).select_hr
    puts '2. login as Line manager - Pass'
    AppNavigationExtensionLM.new(driver).lm_dashboard
    puts '3. navigate to a member of the team that the lm manages - Pass'
    # LM can work on employees, employee
    AppNavigationExtensionLM.new(driver).my_people
    AppNavigationExtensionLM.new(driver).my_employee
    AppNavigationExtensionLM.new(driver).my_employee_leave
    AppNavigationExtensionLM.new(driver).delete_leave_request
    puts '4. delete leave request from Employees, employee'
    AppNavigationExtensionLM.new(driver).my_people
    AppNavigationExtensionLM.new(driver).my_employee
    AppNavigationExtensionLM.new(driver).my_employee_leave
    AppNavigationExtensionLM.new(driver).add_leave_for_my_employee
    LeaveRequestExtension.new(driver).employee_holiday_leave_request_two
    puts '5. add new leave request for Employees, employee - Pass'
    AppNavigationExtensionLM.new(driver).cancel_employee_booked_leave
    puts '6. cancels booked leave for Employees, employee - Pass'
    # AppNavigationExtensionLM.new(driver).add_toil #as per 1006e
    AppNavigationExtensionLM.new(driver).add_adjustment_additional
    AppNavigationExtensionLM.new(driver).subtract_adjustment_subtrack
    puts '7. LM adds toil adjustment to Employees, employee - Pass'
    AppNavigationExtensionLM.new(driver).navigate_to_sickness_edit
    AppNavigationExtensionLM.new(driver).delete_sickness_employees_employee
    AppNavigationExtensionLM.new(driver).create_a_sickness
    puts '8. User able to delete sickness record - Pass'
    # delete existing records
    AppNavigationExtensionLM.new(driver).performance_121_delete_e_of_e
    puts 'delete 121'
    AppNavigationExtensionLM.new(driver).performance_objective_delete_e_of_e
    puts 'delete objective'
    AppNavigationExtensionLM.new(driver).performance_deliverable_delete_e_of_e
    puts 'delete deliverable'
    # need to figure out how to upload a document with ruby(issues)
    # AppNavigationExtensionLM.new(driver).document_delete_e_of_e
    # puts 'delete document'
    AppNavigationExtensionLM.new(driver).job_delete_e_of_e
    puts 'delete job'
    AppNavigationExtensionLM.new(driver).pay_delete_e_of_e
    puts 'delete pay'
    # recreate ready for next test run
    AppNavigationExtensionLM.new(driver).performance_121_create_e_of_e
    puts 'create 121'
    AppNavigationExtensionLM.new(driver).performance_objective_create_e_of_e
    puts 'create objective'
    AppNavigationExtensionLM.new(driver).performance_deliverable_create_e_of_e
    puts 'create deliverable'
    # AppNavigationExtensionLM.new(driver).document_create_e_of_e
    # puts 'create document'
    # job
    AppNavigationExtensionLM.new(driver).job_create_e_of_e
    puts 'create job'
    AppNavigationExtensionLM.new(driver).pay_create_e_of_e
    puts 'create pay'
    AppNavigationExtensionLM.new(driver).lm_logout
    puts 'Test 1006g complete'
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
LMUserDeleteAccess.new.test_1006g_lm_delete_permisssions
