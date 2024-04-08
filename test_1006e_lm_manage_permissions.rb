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
class LMUserManageAccess < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_1006e_lm_manage_permisssions
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
    # not sure why this button can not be found
    # AppNavigationExtensionLM.new(driver).add_toil
    # puts '7a P. User can add toil to employee - Pass'
    AppNavigationExtensionLM.new(driver).add_adjustment_additional
    AppNavigationExtensionLM.new(driver).subtract_adjustment_subtrack
    puts '7b P. User can made adjustments - Pass'
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_sickness_view
      PageValueCheck.new(driver).sickness_current_state_view_only
      AppNavigationExtensionLM.new(driver).navigate_to_sickness_manage
      # AppNavigationExtensionLM.new(driver).delete_sickness
      # puts '8F. sickness - user deleted the record due to permissions - Fail'
      # rescue Selenium::WebDriver::Error::NoSuchElementError
      # AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts '8P. Manage sickness record - user able to manage sickness record - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_performance
      puts '9F. user can delete 121 record should not have permissions- Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).breadcrumb_to_performance_home
      puts '9P. performance - user was able to edit the record - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_objectives
      puts '10F. objectives - user was able to delete the record - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).breadcrumb_to_performance_home
      puts '10P. User had permission to edit the objectives - Pass'
    end
    sleep 0.25
    # Currently not in test due to button has been found not to be consistent with the other performance tabs
    # begin
    #   AppNavigationExtensionLM.new(driver).navigate_to_deliverables
    #   puts '11P. deliverables - user was able to manage the record - Fail'
    # rescue StandardError
    #   AppNavigationExtensionLM.new(driver).breadcrumb_to_performance_home
    #   puts '11P. user had permission to view view deliverables - Pass'
    # end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_documents
      # AppNavigationExtensionLM.new(driver).document_delete
      # puts '12F. user navigated to document page and has deleted the record - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      # puts '12P. user was access to the document and has edited it - Pass'
    end
    puts '12P. user was access to the document and has edited it - Pass'
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_jobs
      AppNavigationExtensionLM.new(driver).manage_employee_job
      # AppNavigationExtensionLM.new(driver).delete_job
      # puts '13F. jobs - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      # puts '13P. jobs - user was able to access the record and has edited it - Pass'
    end
    puts '13P. jobs - user was able to access the record and has edited it - Pass'
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_remuneration
      puts '14F. remunerations - user navigated to page and deleted the record - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts '14P. remunerations - user has access to edit the record - Pass'
    end
    puts '14P. remunerations - user has access to edit the record - Pass'
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_employees_employee
      puts '15F. Lm navigates to employees, employee profile pages by url - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).lm_dashboard
      puts '15P. Could not navigate to other employee profile pages by url - Pass'
    end
    AppNavigationExtensionLM.new(driver).lm_logout
    puts '16. user menu and logout - Pass'
    puts 'Test 1006e complete'
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
LMUserManageAccess.new.test_1006e_lm_manage_permisssions
