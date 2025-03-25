# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/sign_up_extension'
# require File.join(__dir__, "account_employee_setup", "positive_imports", "employee_full.xlsx")
# require './account_employee_setup/positive_imports/employee_full.xlsx'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/create_employee_extension'
require './functions_library/ui_page_element_check_extension'
require './functions_library/test_reference_extension'
require './functions_library/settings_config/account_config_navigation/account_configuration_navigation_extension'
require './functions_library/settings_config/2FA/2fa_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/saas_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class TestSignUp < Base
  attr_accessor :driver

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  def test_sign_up_with_bulk
    NavigateBrowserExtension.new(driver).breathe_signup
    puts '1. Navigate to breathe sign up screen - Pass'
    SignUpExtension.new(driver).sign_up_std_positive
    puts '2. Sign Up Std form - Pass'
    # time to deal with the recapthca if pressent
    sleep 30
    BulkImportExtension.new(driver).navigate_to_bulk_upload
    puts '3. Navigate to bulk upload form - Pass'
    BulkImportExtension.new(driver).bulk_upload_employee_full
    puts '4. Upload full import spreadsheet - Pass'
    BulkImportExtension.new(driver).breadcrumb_data_imports_return
    # added whilst bulk isn't working
    AppNavigationExtensionManager.new(driver).navigate_to_dashboard
    puts '5. Return to Manager Dashboard - Pass'
    AppNavigationExtensionManager.new(driver).navigate_to_people_list
    AppNavigationExtensionManager.new(driver).navigate_to_people_screen_pill
    puts '6. Navigate to People screen via pill - Pass'
    CreateEmployeeExtension.new(driver).create_employee_pending_starter_from_people_page
    puts '7. Create new employee via people page, that will start tomorrow - Pass'
    AppNavigationExtensionManager.new(driver).navigate_to_dashboard
    puts '8. Return to Manager Dashboard - Pass'
    PageValueCheck.new(driver).checking_pending_starter
    puts '9. Employee create - new pending starter is present on account dashboard - Pass'
    CreateEmployeeExtension.new(driver).make_pending_starter_a_finance_user
    puts '10. Make Pending Starter a Finance User - Pass'
    AppNavigationExtensionManager.new(driver).navigate_to_settings_with_welcome_page_active
    NavigationAroundAccountConfiguration.new(driver).navigate_to_two_factor_authentication
    MultiFactorExtension.new(driver).twofa_financeusers_on
    puts '11. Switch on 2FA to Finance User - Pass'
    AppNavigationExtensionManager.new(driver).manager_logout
    puts '12. Logout of direct account admin - Pass'
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).login_as_saas_admin
    LoginAppExtension.new(driver).select_saas
    SaasExtension.new(driver).delete_account_from_direct_search_account_page # if trial
    puts '13. SAAS delete account - Pass'
    # SaasExtension.new(driver).search_direct_trial_account #user if account is active status
    # SaasExtension.new(driver).add_the_ability_for_the_account_to_cancel #user if account is active status
    # puts "SAAS allow account to cancel"
    SaasExtension.new(driver).saas_user_logout
    puts '14. Saas User Logout - Pass'
    Puts 'Test Complete - Positive journey'
    sleep 2
    driver.close
  end

  def test_sign_up_with_add_employee_manually
    NavigateBrowserExtension.new(driver).breathe_signup
    puts '1. Navigate to breathe sign up screen - Pass'
    SignUpExtension.new(driver).sign_up_std_positive
    puts '2. Sign Up Std form - Pass'
    # time to deal with the recapthca if pressent and remove gravatar setting in settings
    sleep 30
    AppNavigationExtensionManager.new(driver).navigate_to_dashboard
    puts '3. Navigate to Manager Dashboard - Pass'
    AppNavigationExtensionManager.new(driver).navigate_to_people_screen
    puts '4. Navigate to People screen via pill - Pass'
    CreateEmployeeExtension.new(driver).create_employee_pending_starter_from_people_page
    puts '5. Create new employee via people page, that will start tomorrow - Pass'
    sleep 0.25
    AppNavigationExtensionManager.new(driver).navigate_to_dashboard
    puts '6. Return to Manager Dashboard - Pass'
    PageValueCheck.new(driver).checking_pending_starter # might need to scroll on this
    puts '7. Employee create - new pending starter is present on account dashboard - Pass'
    CreateEmployeeExtension.new(driver).make_pending_starter_a_finance_user
    # add in a check on finance user being applied on the saved page
    puts '8. Make Pending Starter a Finance User - Pass'
    AppNavigationExtensionManager.new(driver).navigate_to_settings_with_welcome_page_active
    NavigationAroundAccountConfiguration.new(driver).navigate_to_two_factor_authentication
    MultiFactorExtension.new(driver).twofa_everyone_on
    puts '9. Switch on 2FA for all users - Pass'
    AppNavigationExtensionManager.new(driver).manager_logout
    puts '10. Logout of direct account admin - Pass'
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).login_as_saas_admin
    LoginAppExtension.new(driver).select_saas
    SaasExtension.new(driver).delete_account_from_direct_search_account_page # if trial
    SaasExtension.new(driver).delete_modal_confirm
    puts '11. SAAS delete account - Pass'
    SaasExtension.new(driver).saas_user_logout
    puts '12. Saas User Logout - Pass'
    puts 'PT Complete - Signup and employee manual create'
    sleep 2
    driver.close
  end

  def signup_login_path
    # SIGN UP PATH NEED TO GO TO THE RIGHT URL (STAGING)
    NavigateBrowserExtension.new(driver).breathe_signup
    # NavigateBrowserExtension.new(driver).cookie_modal_accept
    sleep 1
    SignUpExtension.new(driver).sign_up_login_button
    sleep 1
    LoginExtension.new(driver).login_setup_acc_admin
    PageValueCheck.new(driver).signup_fail_check
    puts '1. Login from sign up page - Pass'
    sleep 1
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
# TestSignUp.new.test_sign_up_with_bulk
TestSignUp.new.test_sign_up_with_add_employee_manually
# TestSignUp.new.signup_login_path
puts 'Test 1001 COMPLETE - PASS'
