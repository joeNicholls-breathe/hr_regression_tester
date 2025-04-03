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
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
class LMUserViewAccess < Base
  attr_accessor :driver

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  def test_1006c_lm_view_permisssions
    NavigateBrowserExtension.new(driver).breathe_login
    puts '1. navigate to breathe login url - Pass'
    LoginExtension.new(driver).login_setup_acc_line_manager_user
    LoginAppExtension.new(driver).select_hr
    puts '2. login as Line manager - Pass'
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
      AppNavigationExtensionLM.new(driver).add_adjustment_additional
      AppNavigationExtensionLM.new(driver).subtract_ajustment_subtrack
      puts '6F. user added toil adjustment - this user shouldnt have this permissions - Fail'
    rescue StandardError
      puts '6P. Could not add toil user has not got permissions - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_sickness_manage_own_employee
      puts '7F. sickness - user navigated to page and could manage the record due to permissions - Fail'
    rescue Selenium::WebDriver::Error::NoSuchElementError
      AppNavigationExtensionLM.new(driver).navigate_to_sickness_view_own_employee
      PageValueCheck.new(driver).sickness_current_state_view_only
      puts '7P. Could not manage sickness record - user unable to manage sickness record - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_learn_own_employee
      puts '8F. learn - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard_error_page_not_found
      puts '8P. Could not access the learn page due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_performance_own_employee
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard_error_page_not_found
      puts '9P. performance - user was unable to edit due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_objectives_own_employee
      puts '10F. objectives - user was able to manage the record - Fail'
    rescue StandardError
      puts '10P. User had permission to view objectives - Pass'
    end
    sleep 0.5
    # begin
    # Not in test as button found not to be consistent with other performance tabs
    #   AppNavigationExtensionLM.new(driver).navigate_to_deliverables
    #   puts '11F. deliverables - user was able to manage the record - Fail'
    # rescue StandardError
    #   AppNavigationExtensionLM.new(driver).breadcrumb_to_performance_home
    #   puts '11P. user had permission to view view deliverables - Pass'
    # end
    puts '11. Performance deliverables test, not in use as button is not present on form'
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_documents_own_employee
      AppNavigationExtensionLM.new(driver).document_delete_own_employee
      puts '12F. user navigated to document page, editted and deleted document - Fail'
    rescue StandardError
      puts '12P. User unable to delete but currently as at 2/4/25 can edit and manage documents on view - FAIL and PASS'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_jobs_own_employee
      AppNavigationExtensionLM.new(driver).manage_employee_job
    rescue Selenium::WebDriver::Error::NoSuchElementError
      puts '13P. jobs - user was only able to view employee job - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_remuneration_own_employee
      puts '14F. remunerations - user navigated to pages not accessible due to permissions - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard_error_page_not_found
      puts '14P. remunerations - user was unable to access the page due to current permissions set up - Pass'
    end
    begin
      AppNavigationExtensionLM.new(driver).navigate_to_employees_employee
      puts '15F. Lm navigates to employees, employee profile pages by url - Fail'
    rescue StandardError
      AppNavigationExtensionLM.new(driver).return_to_dashboard_error_page_not_found
      puts '15P. Could not navigate to other employee profile pages by url- Pass'
    end
    LogoutExtension.new(driver).user_logout
    puts '16. user menu and logout - Pass'
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
LMUserViewAccess.new.test_1006c_lm_view_permisssions
puts 'Test 1006c COMPLETED - PASS'
