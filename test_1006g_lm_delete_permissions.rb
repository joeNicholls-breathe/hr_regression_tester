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
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).login_setup_acc_lm_employee_user
    LoginAppExtension.new(driver).select_hr
    HolidayExtension.new(driver).holiday_request_dashboard_navigate_employee
    LeaveRequestExtension.new(driver).employee_holiday_leave_request_one
    sleep 0.50
    AppNavigationExtensionLM.new(driver).lm_logout
    puts '1. Request leave as Employees, employee'
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).login_setup_acc_line_manager_user
    LoginAppExtension.new(driver).select_hr
    puts '2. login as Line manager - Pass'
    AppNavigationExtensionLM.new(driver).lm_dashboard
    puts '3. navigate to a member of the team that the lm manages - Pass'
    AppNavigationExtensionLM.new(driver).my_people
    AppNavigationExtensionLM.new(driver).my_employee
    AppNavigationExtensionLM.new(driver).my_employee_leave
    AppNavigationExtensionLM.new(driver).delete_leave_request
    puts '4. delete leave request from Employees, employee'
    AppNavigationExtensionLM.new(driver).my_people
    AppNavigationExtensionLM.new(driver).my_employee
    AppNavigationExtensionLM.new(driver).my_employee_leave
    sleep 1
    AppNavigationExtensionLM.new(driver).view_leave_record
    PageValueCheck.new(driver).employee_leave_remaining
    puts '4a. view the employees leave record - Pass'
    AppNavigationExtensionLM.new(driver).approve_employee_leave_request
    puts '4b. approve employee leave request'
    AppNavigationExtensionLM.new(driver).return_to_employee_leave_index # can remove once work out the above issue.
    AppNavigationExtensionLM.new(driver).add_leave_for_my_employee
    LeaveRequestExtension.new(driver).employee_holiday_leave_request_two
    puts '5. add new leave request for employee - Pass'
    sleep 0.50
    AppNavigationExtensionLM.new(driver).cancel_employee_leave_request
    puts '6. cancel booked leave - Pass'
    AppNavigationExtensionLM.new(driver).add_toil
    AppNavigationExtensionLM.new(driver).add_adjustment_additional
    AppNavigationExtensionLM.new(driver).subtract_ajustment_subtrack
    puts '7. User added toil adjustment - Pass'
    AppNavigationExtensionLM.new(driver).navigate_to_sickness_view
    PageValueCheck.new(driver).sickness_current_state_view_only
    puts '8. User able to manage sickness record - Pass'
    AppNavigationExtensionLM.new(driver).navigate_to_learn
    puts '9. Learn page visible - Pass'
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_performance
      puts '10F. performance - user can edit the 121 record which they should not have permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).breadcrumb_to_performance_home
      puts '10P. performance - user was unable to edit due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_objectives
      puts '11F. objectives - user was able to manage the record - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).breadcrumb_to_performance_home
      puts '11P. User had permission to view objectives - Pass'
    end
    sleep 0.25
    # Currently not in test due to button has been found not to be consistent with the other performance tabs
    # begin
    #   AppNavigationExtensionLM.new(driver).navigate_to_deliverables
    #   puts '12P. deliverables - user was able to manage the record - Fail'
    # rescue StandardError
    #   AppNavigationExtensionLM.new(driver).breadcrumb_to_performance_home
    #   puts '12P. user had permission to view view deliverables - Pass'
    # end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_documents
      puts '13F. user navigated to document page - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts '13P. user was unable to access the page due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_jobs
      puts '14F. jobs - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts '14P. jobs - user was unable to access the page due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_remuneration
      puts '15F. remunerations - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts '15P. remunerations - user was unable to access the page due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_employees_employee
      puts '16F. attempt to navigate to other employee profile pages by url'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).lm_dashboard
      puts '16P. Could not navigate to other employee profile pages by url'
    end
    AppNavigationExtensionLM.new(driver).lm_logout
    puts 'delete any notes made on the employee'
    puts 'Test 1006g complete'
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
LMUserDeleteAccess.new.test_1006g_lm_delete_permisssions
