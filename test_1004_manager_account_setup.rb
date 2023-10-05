# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/ui_page_element_check'
require './functions_library/test_reference_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_manager'
require './functions_library/settings_config/2FA/2fa_extension'
require './functions_library/settings_config/account_config_navigation/account_configuration_navigation_extension'
require './functions_library/settings_config/account_details/account_details_extension'
require './functions_library/settings_config/account_modules/account_modules_extension'
require './functions_library/settings_config/account_picklists/picklist_extension'
require './functions_library/settings_config/account_picklists/picklist_contract_extension'
require './functions_library/settings_config/account_picklists/picklist_gender_extension'
require './functions_library/settings_config/api_setup/api_setup_extension'
require './functions_library/settings_config/calendar_subscription/calendar_subscription_extension'
require './functions_library/settings_config/company_blackouts/company_blackouts_extension'
require './functions_library/settings_config/company_holiday/company_holiday_extension'
require './functions_library/settings_config/email_notifications/email_notification_extension'
require './functions_library/settings_config/holiday_allowance/holiday_allowance_extension'
require './functions_library/settings_config/holiday_years/holiday_years_extension'
require './functions_library/settings_config/rotacloud/rotacloud_extension'
require './functions_library/settings_config/working_patterns/working_patterns_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/ClassLength
class AccountSetup < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_account_setup
    NavigateBrowserExtension.new(driver).breathe_login
    puts '1. navigate to breathe login url'
    LoginExtension.new(driver).login_setup_acc_admin
    LoginAppExtension.new(driver).select_hr
    puts '2. login'
    # AppNavigationExtensionManager.new(driver).pop_modal_price_increase
    # puts "2a. price modal dismiss - cookie refresh so only when FF is On"
    AppNavigationExtensionManager.new(driver).navigate_to_settings_with_welcome_page_active
    puts '3. navigate to configuration settings'
    NavigationAroundAccountConfiguration.new(driver).navigate_to_company_details
    AccountDetailsExtension.new(driver).company_details_data_entry_edit_positive
    puts '4. enter company details - save changes'
    AccountDetailsExtension.new(driver).company_details_data_entry_cancel_changes
    puts '5. enter company details - cancel changes'
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb
    puts '6. return to company settings'
    NavigationAroundAccountConfiguration.new(driver).navigate_to_modules_chargable
    # AccountModulesExtension.new(driver).modules_chargable_switch_on
    # puts "switch on modules - chargable"
    NavigationAroundAccountConfiguration.new(driver).navigate_to_modules_free
    AccountModulesExtension.new(driver).modules_free_switch_on_off
    puts '7. switch on and off modules - free'
    sleep 1
    AccountModulesExtension.new(driver).custom_fields
    puts '8. add a custom field'
    AccountModulesExtension.new(driver).payroll_export_log_changes_only_on
    puts '9a. switch on payroll exports'
    AccountModulesExtension.new(driver).payroll_export_log_off
    puts '9b. switch off payroll exports'
    AccountModulesExtension.new(driver).person_change_logs
    puts '10a. switch on change logs'
    AccountModulesExtension.new(driver).person_change_logs
    puts '10b. switch off change logs'
    AccountModulesExtension.new(driver).onboarding_tasks_on
    puts '11a. Turn on onboarding tasks'
    AccountModulesExtension.new(driver).onboarding_tasks_off
    puts '11b. Turn off onboarding tasks'
    AccountModulesExtension.new(driver).xero_payroll_integration_on
    puts '12. switch on xero integration might want to do this as the buy now journey'
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb
    sleep 0.50
    NavigationAroundAccountConfiguration.new(driver).navigate_to_picklist
    puts '13a. navigate to picklists'
    PicklistContactExtension.new(driver).details_navigate_to_contract_type
    puts '13b. navigate to picklist - Contract types'
    PicklistContactExtension.new(driver).details_contract_types_add
    puts '14a. Contract types - Add'
    PicklistContactExtension.new(driver).details_contract_types_add_cancel
    puts '14b. Contract types - Cancel add new'
    PicklistContactExtension.new(driver).details_contract_types_edit
    puts '14c. Contract type - Edit'
    PicklistContactExtension.new(driver).details_contract_types_edit_cancel
    puts '14d. Contract type - Cancel Edit'
    sleep 0.50
    PicklistContactExtension.new(driver).details_contract_types_delete
    puts '14e. Contract type - Delete'
    PicklistContactExtension.new(driver).details_contract_types_delete_cancel
    puts '14f. Contract type - Cancel delete'
    PicklistContactExtension.new(driver).details_contract_type_add_return_breadcrumb
    puts '14g. Breadcrumb return from Contract type'
    NavigationAroundAccountConfiguration.new(driver).return_to_picklist_menu
    puts '15a. retutn to picklists'
    PicklistGenderExtension.new(driver).navigate_to_gender
    puts '15b. navigate to genders'
    PicklistGenderExtension.new(driver).details_genders_add
    puts '16a. Gender add new'
    PicklistGenderExtension.new(driver).details_genders_edit
    puts '16b. Gender edit'
    PicklistGenderExtension.new(driver).delete_gender
    puts '16c. Gender delete'
    PicklistGenderExtension.new(driver).details_genders_return_breadcrumb
    puts '16d. Breadcrumb return to picklist Contract type'
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb
    NavigationAroundAccountConfiguration.new(driver).navigate_to_email_notifications
    puts '17. navigate to Email notification'
    EmailNotificationConfigExtension.new(driver).system_notifications_off
    puts '18a. System email notification Off'
    EmailNotificationConfigExtension.new(driver).system_notifications_on
    puts '18b. System email notification On'
    EmailNotificationConfigExtension.new(driver).third_party_email_invoice
    puts '18c. Email notification thid party invoice email'
    EmailNotificationConfigExtension.new(driver).third_party_email_leave_request_approval
    puts '18d. Email notification thid party leave requests email'
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb_email_notification
    NavigationAroundAccountConfiguration.new(driver).navigate_to_woking_patterns
    puts '19. Navigate to Abscence settings - Working Patterns'
    AccountWorkingPatternExtension.new(driver).working_pattern_add
    puts '20a. Working Pattern'
    AccountWorkingPatternExtension.new(driver).working_pattern_set_new_default
    puts '20b. Working Pattern'
    AccountWorkingPatternExtension.new(driver).working_pattern_edit
    puts '20c. Working Pattern'
    AccountWorkingPatternExtension.new(driver).working_pattern_delete
    puts '20d. Working Pattern'
    AccountWorkingPatternExtension.new(driver).working_pattern_search
    puts '20e. Working Pattern'
    AccountWorkingPatternExtension.new(driver).working_pattern_show_inactive
    puts '20f. Working Pattern'
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb
    NavigationAroundAccountConfiguration.new(driver).navigate_to_holiday_allowances
    puts '21 Navigate to Abscence settings - holidays allowances'

    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb

    NavigationAroundAccountConfiguration.new(driver).navigate_to_holiday_years
    puts 'Navigate to Abscence settings - holidays years'
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb

    NavigationAroundAccountConfiguration.new(driver).navigate_to_company_holidays
    puts 'Navigate to Abscence settings - company holidays'
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb

    NavigationAroundAccountConfiguration.new(driver).navigate_to_company_blackout
    puts 'Navigate to Abscence settings - company blackouts'
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb

    NavigationAroundAccountConfiguration.new(driver).navigate_to_api_setup
    puts 'Navigate to Integrations - API setup'
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb

    NavigationAroundAccountConfiguration.new(driver).navigate_to_calendar_subscriptions
    puts 'Navigate to Integrations - calendar subscriptions'
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb

    NavigationAroundAccountConfiguration.new(driver).navigate_to_rota_cloud
    puts 'Navigate to Integrations - Rotacloud'
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb

    puts 'add HR to account'
    puts 'add line manager to account'
    puts 'add employee to account'
    puts 'assign HR permissions to employee'
    puts 'assign line managers to employee'
    puts 'assign permissions to employee'

    sleep 10
    driver.close
  end
end
# rubocop:enable Metrics/ClassLength
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

AccountSetup.new.test_account_setup
