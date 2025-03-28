# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/ui_page_element_check_extension'
require './functions_library/test_reference_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/logout_extension'
require './functions_library/holiday_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/navigate_around_app_employee_extension'
require './functions_library/create_employee_extension'
require './functions_library/delete_employee_extension'
require './functions_library/leave_request_extension'
require './functions_library/settings_config/account_config_navigation/account_configuration_navigation_extension'
require './functions_library/settings_config/hr_user_config/hr_user_config_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class AccountSetupHRUser < Base
  attr_accessor :driver

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  def test_hr_user_setup
    NavigateBrowserExtension.new(driver).breathe_login
    puts '1. navigate to breathe login url'
    LoginExtension.new(driver).login_setup_acc_admin
    LoginAppExtension.new(driver).select_hr
    puts '2. login'
    AppNavigationExtensionManager.new(driver).navigate_to_add_new_employee
    CreateEmployeeExtension.new(driver).create_hr_user
    puts '3. add HR to account'
    CreateEmployeeExtension.new(driver).make_hr_user
    puts '4. assign HR permissions to employee'
    AppNavigationExtensionManager.new(driver).navigate_to_settings_with_welcome_page_active
    NavigationAroundAccountConfiguration.new(driver).navigate_to_change_what_hr_users_can_do
    puts '5. navigate to HR settings - assign account settings to HR user'
    # HrUserConfigExtension.new(driver).hr_user_configuration_use_gravatar
    # removed as chrome takes to long to load pages in automation script run
    HrUserConfigExtension.new(driver).hr_user_configuration_use_bradford_factor
    HrUserConfigExtension.new(driver).hr_user_configuration_remind_line_manager_to_give_121_off
    HrUserConfigExtension.new(driver).hr_user_configuration_grapevine_label_clear
    HrUserConfigExtension.new(driver).update_hr_settings
    puts '6. remove settings from all HR user/account - (bradford/121 reminders/grapevine)'
    sleep 2
    LogoutExtension.new(driver).user_logout
    puts '7. logout'
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).login_setup_acc_hr_user
    LoginAppExtension.new(driver).select_hr
    puts '8. login as hr user'
    AppNavigationExtensionManager.new(driver).navigate_to_my_dashboard
    NavigateAroundAppEmployee.new(driver).navigate_to_leave_request_widget_request_leave
    LeaveRequestExtension.new(driver).make_leave_request_half_day('16/12/2025', '16/12/2025')
    puts '9. create holiday request'
    # AppNavigationExtensionManager.new(driver).navigate_to_my_dashboard
    # PageValueCheck.new(driver).check_leave_has_ben_requested
    # puts '10. check that user can not self approve leave'
    sleep 1
    AppNavigationExtensionManager.new(driver).navigate_to_settings_with_welcome_page_active_hr_user
    NavigationAroundAccountConfiguration.new(driver).navigate_to_change_what_hr_users_can_do_as_hr
    # HrUserConfigExtension.new(driver).hr_user_configuration_use_gravatar
    HrUserConfigExtension.new(driver).hr_user_configuration_use_bradford_factor
    HrUserConfigExtension.new(driver).hr_user_configuration_remind_line_manager_to_give_121_on
    HrUserConfigExtension.new(driver).hr_user_configuration_grapevine_label
    HrUserConfigExtension.new(driver).update_hr_settings
    sleep 0.25
    puts '11. adds settings back to HR user/account
            (approve own leave/bradford factor/121 reminders/grapevine)'
    NavigateAroundAppEmployee.new(driver).navigate_to_profile_employee
    puts '12a. check employee own profile summary'
    AppNavigationExtensionManager.new(driver).navigate_to_my_dashboard
    NavigateAroundAppEmployee.new(driver).navigate_to_leave_request_widget_request_leave
    LeaveRequestExtension.new(driver).make_leave_request('11/11/2025', '12/11/2025')
    sleep 2
    puts '12b. create holiday request'
    LogoutExtension.new(driver).user_logout
    puts '13. logout'
    LoginExtension.new(driver).login_setup_acc_admin
    puts '14. login as admin'
    AppNavigationExtensionManager.new(driver).search_employee_hr
    sleep 1
    DeleteEmployeeExtension.new(driver).delete_employee_hr_user
    puts '15. delete hr user'
    sleep 1.5
    AppNavigationExtensionManager.new(driver).search_employee_harold
    NavigateAroundAppEmployee.new(driver).navigate_to_my_profile_leave_requested
    LeaveRequestExtension.new(driver).delete_leave_request_requested
    sleep 1.5
    LeaveRequestExtension.new(driver).delete_leave_request_requested
    sleep 1.5
    puts '16. delete leave requests'
    AppNavigationExtensionManager.new(driver).navigate_to_settings_with_welcome_page_active
    NavigationAroundAccountConfiguration.new(driver).navigate_to_change_what_hr_users_can_do
    HrUserConfigExtension.new(driver).update_hr_settings
    puts '17. test maintanence - reinstate hr users need approval for leave requests'
    sleep 2
    LogoutExtension.new(driver).user_logout
    puts '18. logout'
    sleep 1
    driver.close
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength

AccountSetupHRUser.new.test_hr_user_setup
puts 'Test 1005 COMPLETE - PASS'
