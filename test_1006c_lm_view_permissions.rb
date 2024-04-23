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

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
class LMUserViewAccess < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_1006c_lm_view_permisssions
    NavigateBrowserExtension.new(driver).breathe_login
    puts '1. navigate to breathe login url - Pass'
    LoginExtension.new(driver).login_setup_acc_line_manager_user
    LoginAppExtension.new(driver).select_hr
    puts '2. login as Line manager - Pass'
    AppNavigationExtensionLM.new(driver).lm_dashboard
    puts '3. navigate to a member of the team that the lm manages - Pass'
    AppNavigationExtensionLM.new(driver).my_people
    AppNavigationExtensionLM.new(driver).my_employee
    AppNavigationExtensionLM.new(driver).my_employee_leave
    sleep 1
    AppNavigationExtensionLM.new(driver).view_leave_record
    PageValueCheck.new(driver).employee_leave_remaining
    puts '4a. view the employees leave record - Pass'
    # AppNavigationExtensionLM.new(driver).approve_employee_leave_request
    # puts '4b. approve employee leave request'
    AppNavigationExtensionLM.new(driver).return_to_employee_leave_index # can remove once work out the above issue.
    AppNavigationExtensionLM.new(driver).add_leave_for_my_employee
    LeaveRequestExtension.new(driver).employee_holiday_leave_request_two
    puts '5. add new leave request for employee - Pass'
    sleep 0.50
    AppNavigationExtensionLM.new(driver).cancel_employee_leave_request
    puts '6. cancel booked leave - Pass'
    begin
      AppNavigationExtensionLM.new(driver).add_toil
      AppNavigationExtensionLM.new(driver).add_adjustment_additional
      AppNavigationExtensionLM.new(driver).subtract_ajustment_subtrack
      puts '7F. user added toil adjustment - this user shouldnt have this permissions - Fail'
    rescue StandardError
      puts '7P. Could not add toil user has not got permissions - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_sickness_manage
      puts '8F. sickness - user navigated to page and could manage the record due to permissions - Fail'
    rescue Selenium::WebDriver::Error::NoSuchElementError
      AppNavigationExtensionLM.new(driver).navigate_to_sickness_view
      PageValueCheck.new(driver).sickness_current_state_view_only
      puts '8P. Could not manage sickness record - user unable to manage sickness record - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_learn
      puts '9F. learn - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts '9P. Could not access the learn page due to current permissions set up - Pass'
    end
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
    sleep 0.5
    # begin
    # Not in test as button found not to be consistent with other performance tabs
    #   AppNavigationExtensionLM.new(driver).navigate_to_deliverables
    #   puts '12F. deliverables - user was able to manage the record - Fail'
    # rescue StandardError
    #   AppNavigationExtensionLM.new(driver).breadcrumb_to_performance_home
    #   puts '12P. user had permission to view view deliverables - Pass'
    # end
    p '12. Performance deliverables test, not in use as button is not presenton form'
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_documents
      puts '13F. user navigated to document page - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts '13P. User was unable to edit and manage documents - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_jobs
      AppNavigationExtensionLM.new(driver).manage_employee_job
      puts '14F. jobs - user navigated to pages not accessible due to permissions - Fail'
    # rescue StandardError
    rescue Selenium::WebDriver::Error::NoSuchElementError
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
      puts '16F. Lm navigates to employees, employee profile pages by url - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts '16P. Could not navigate to other employee profile pages by url- Pass'
    end
    AppNavigationExtensionLM.new(driver).lm_logout
    puts '17. user menu and logout - Pass'
    puts 'Test 1006c complete'
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
LMUserViewAccess.new.test_1006c_lm_view_permisssions
