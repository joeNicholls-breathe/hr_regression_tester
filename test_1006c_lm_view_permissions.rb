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
class LMUserViewAccess < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_line_view_manage_permisssions
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
      puts 'user added toil adjustment - this user shouldnt have this permissions - Fail'
    rescue StandardError
      puts 'did not add toil user has not got permissions - Pass'
    end
    puts '7. Could not add toil as user must have manage permissions'
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_sickness
      puts 'sickness - user navigated to page and could manage the record due to permissions - Fail'
    rescue StandardError
      PageValueCheck.new(driver).sickness_current_state_view_only
      puts 'sickness - user was able to view the sickness record but could not manage - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_learn
      puts 'learn - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts 'learn - user was unable to access the page due to current permissions set up - Pass'
    end
    # current location in build
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_performance
      puts 'performance - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts 'performance - user was unable to access the page due to current permissions set up - Pass'
    end
    puts 'view objectives'
    puts 'view deliverables'
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_documents
      puts 'documents - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts 'documents - user was unable to access the page due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_jobs
      puts 'jobs - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts 'jobs - user was unable to access the page due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_remuneration
      puts 'remunerations - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts 'remunerations - user was unable to access the page due to current permissions set up - Pass'
    end
    puts 'view employees remunerations package (salary/additional payments/benefits/bank details)'
    puts '8. attempt to navigate to other employee profile pages by url'
    puts 'Test 1006c complete'
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
LMUserViewAccess.new.test_line_view_manage_permisssions
