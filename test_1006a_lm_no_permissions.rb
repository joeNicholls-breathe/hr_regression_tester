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
class LMUserNoAccess < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_line_manger_no_permisssions
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
      puts '7F. user added toil adjustment - this user shouldnt have this permissions - Fail'
    rescue StandardError
      puts '7P. Did not add toil user has not got permissions - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_sickness
      puts '8F. sickness - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts '8P. sickness - user was unable to access the page due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_learn
      puts '9F. learn - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts '9P. learn - user was unable to access the page due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_performance
      puts '10F. performance - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts '10P. performance - user was unable to access the page due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_documents
      puts '11F. documents - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts '11P. documents - user was unable to access the page due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_jobs
      puts '12F. jobs - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts '12P. jobs - user was unable to access the page due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_remuneration
      puts '13F. remunerations - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard
      puts '13P. remunerations - user was unable to access the page due to current permissions set up - Pass'
    end
    AppNavigationExtensionLM.new(driver).lm_logout
    puts '14. user menu and logout - Pass'
    puts 'Test 1006a complete'
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/CyclomaticComplexity
LMUserNoAccess.new.test_line_manger_no_permisssions
