# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/ui_page_element_check_extension'
require './functions_library/test_reference_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_lm_extension'
require './functions_library/leave_request_extension'
require './functions_library/logout_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class LMUserNoAccess < Base
  attr_accessor :driver

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  # lm permissions for profile manage - personal profile view ticked as std for the initial test permissions

  def test_1006a_lm_no_permisssions
    NavigateBrowserExtension.new(driver).breathe_login
    puts '1. navigate to breathe login url - Pass'
    LoginExtension.new(driver).login_setup_acc_line_manager_user
    LoginAppExtension.new(driver).select_hr
    puts '2. login as Line manager - Pass'
    sleep 1
    AppNavigationExtensionLM.new(driver).my_people
    AppNavigationExtensionLM.new(driver).my_employee
    AppNavigationExtensionLM.new(driver).my_employee_leave
    sleep 1
    AppNavigationExtensionLM.new(driver).view_leave_request_record
    PageValueCheck.new(driver).employee_leave_requested
    puts '3. view the employees leave record - Pass'
    AppNavigationExtensionLM.new(driver).return_to_employee_leave_index # can remove once work out the above issue.
    AppNavigationExtensionLM.new(driver).add_leave_for_my_employee
    LeaveRequestExtension.new(driver).make_leave_request('11/11/2025', '12/11/2025')
    puts '4. add new leave request for employee - Pass'
    sleep 0.50
    AppNavigationExtensionLM.new(driver).cancel_employee_leave_request
    puts '5. cancel booked leave - Pass'
    begin
      AppNavigationExtensionLM.new(driver).add_toil
      puts '6F. user added toil adjustment - this user shouldnt have this permissions - Fail'
    rescue StandardError
      puts '6P. Did not add toil user has not got permissions - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_sickness_view_own_employee
      puts '7F. sickness - user navigated to pages not accessible due to permissions - Fail'
    rescue Selenium::WebDriver::Error::NoSuchElementError
      AppNavigationExtensionLM.new(driver).return_to_dashboard_error_page_not_found
      puts '7P. sickness - user was unable to access the page due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_learn_own_employee
      puts '8F. learn - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard_error_page_not_found
      puts '8P. learn - user was unable to access the page due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_performance_own_employee
      puts '9F. performance - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard_error_page_not_found
      puts '9P. performance - user was unable to access the page due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_jobs_own_employee
      puts '10F. jobs - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard_error_page_not_found
      puts '10P. jobs - user was unable to access the page due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_remuneration_own_employee
      puts '11F. remunerations - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard_error_page_not_found
      puts '11P. remunerations - user was unable to access the page due to current permissions set up - Pass'
    end
    LogoutExtension.new(driver).user_logout
    puts '12. user menu and logout - Pass'
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
puts 'Test 1006a Line Manager testing NO permisssions'
LMUserNoAccess.new.test_1006a_lm_no_permisssions
puts 'Test 1006a COMPLETED - PASS'
