require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension.rb'
require './functions_library/sign_up_extension.rb'
#require File.join(__dir__, "account_employee_setup", "positive_imports", "employee_full.xlsx")
#require './account_employee_setup/positive_imports/employee_full.xlsx'
require './functions_library/navigate_around_app_manager.rb'
require './functions_library/create_employee_extension.rb'
require './functions_library/ui_page_element_check.rb'
require './functions_library/test_reference_extension.rb'
require './functions_library/settings_config/account_config_navigation/account_configuration_navigation_extension.rb'
require './functions_library/settings_config/2FA/2fa_extension.rb'
require './functions_library/login_extension.rb'
require './functions_library/login_app_extension.rb'
require './functions_library/saas_extension.rb'

class TestSignUp < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_sign_up_with_bulk
    NavigateBrowserExtension.new(driver).breathe_signup
    puts "Navigate to breathe sign up screen - Pass"
    NavigateBrowserExtension.new(driver).cookie_modal_accept
    puts "Pop Up - Cookies - Accept - Pass"
    SignUpExtension.new(driver).sign_up_std_positive
    puts "Sign Up Std form - Pass"
    BulkImportExtension.new(driver).navigate_to_bulk_upload
    puts "Navigate to bulk upload form - Pass"
    BulkImportExtension.new(driver).bulk_upload_employee_full
    puts "Upload full import spreadsheet - Pass"
    BulkImportExtension.new(driver).breadcrumb_data_imports_return
    #added whilst bulk isn't working
    AppNavigationExtensionManager.new(driver).navigate_to_dashboard
    puts "Return to Manager Dashboard - Pass"
    AppNavigationExtensionManager.new(driver).navigate_to_people_list
    AppNavigationExtensionManager.new(driver).navigate_to_people_screen_pill
    puts "Navigate to People screen via pill - Pass"
    CreateEmployeeExtension.new(driver).create_employee_pending_starter_from_people_page
    puts "Create new employee via people page, that will start tomorrow - Pass"
    AppNavigationExtensionManager.new(driver).navigate_to_dashboard
    puts "Return to Manager Dashboard - Pass"
    PageValueCheck.new(driver).checking_pending_starter
    puts "Employee create - new pending starter is present on account dashboard - Pass"
    CreateEmployeeExtension.new(driver).make_pending_starter_a_finance_user
    puts "Make Pending Starter a Finance User - Pass"
    AppNavigationExtensionManager.new(driver).navigate_to_settings_with_welcome_page_active
    NavigationAroundAccountConfiguration.new(driver).navigate_to_two_factor_authentication
    MultiFactorExtension.new(driver).twofa_financeusers_on
    puts "Switch on 2FA to Finance User - Pass"
    AppNavigationExtensionManager.new(driver).manager_logout
    puts "Logout of direct account admin - Pass"
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).login_as_saas_admin
    LoginAppExtension.new(driver).select_saas
    SaasExtension.new(driver).delete_account_from_direct_search_account_page #if trial
    puts "SAAS delete account - Pass"

    #SaasExtension.new(driver).search_direct_trial_account #user if account is active status
    #SaasExtension.new(driver).add_the_ability_for_the_account_to_cancel #user if account is active status
    #puts "SAAS allow account to cancel"

    SaasExtension.new(driver).saas_user_logout
    puts "Saas User Logout - Pass"
    Puts "Test Complete - Positive journey"
    sleep 2
    driver.close
  end

  def test_sign_up_with_add_employee_manually
    NavigateBrowserExtension.new(driver).breathe_signup
    puts "Navigate to breathe sign up screen - Pass"
    NavigateBrowserExtension.new(driver).cookie_modal_accept
    puts "Pop Up - Cookies - Accept - Pass"
    SignUpExtension.new(driver).sign_up_std_positive
    puts "Sign Up Std form - Pass"
    AppNavigationExtensionManager.new(driver).navigate_to_dashboard
    puts "Return to Manager Dashboard - Pass"
    AppNavigationExtensionManager.new(driver).navigate_to_people_screen_pill
    puts "Navigate to People screen via pill - Pass"
    CreateEmployeeExtension.new(driver).create_employee_pending_starter_from_people_page
    puts "Create new employee via people page, that will start tomorrow - Pass"
    AppNavigationExtensionManager.new(driver).navigate_to_dashboard
    puts "Return to Manager Dashboard - Pass"
    PageValueCheck.new(driver).checking_pending_starter
    puts "Employee create - new pending starter is present on account dashboard - Pass"
    CreateEmployeeExtension.new(driver).make_pending_starter_a_finance_user
    puts "Make Pending Starter a Finance User - Pass"
    AppNavigationExtensionManager.new(driver).navigate_to_settings_with_welcome_page_active
    NavigationAroundAccountConfiguration.new(driver).navigate_to_two_factor_authentication
    MultiFactorExtension.new(driver).twofa_financeusers_on
    puts "Switch on 2FA to Finance User - Pass"
    AppNavigationExtensionManager.new(driver).manager_logout
    puts "Logout of direct account admin - Pass"
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).login_as_saas_admin
    LoginAppExtension.new(driver).select_saas
    SaasExtension.new(driver).delete_account_from_direct_search_account_page #if trial
    puts "SAAS delete account - Pass"
    SaasExtension.new(driver).saas_user_logout
    puts "Saas User Logout - Pass"
    puts "PT Complete - Signup and employee manual create"
    sleep 2
    driver.close
  end

  def signup_login_path
    NavigateBrowserExtension.new(driver).breathe_signup
    NavigateBrowserExtension.new(driver).cookie_modal_accept
    SignUpExtension.new(driver).sign_up_login_button
    LoginExtension.new(driver).login_setup_acc_admin
    PageValueCheck.new(driver).signup_fail_check
    puts "Login from sign up page - Pass"
    driver.close
  end
end

#TestSignUp.new.test_sign_up_with_bulk
TestSignUp.new.test_sign_up_with_add_employee_manually
TestSignUp.new.signup_login_path
