# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/ui_page_element_check_extension'
require './functions_library/test_reference_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_manager_extension'
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
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
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
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb
    puts '6. return to company settings'
    NavigationAroundAccountConfiguration.new(driver).navigate_to_modules_free
    AccountModulesExtension.new(driver).modules_free_switch_on_off
    puts '7a. switch on and off modules - free'
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_to_modules_chargable
    AccountModulesExtension.new(driver).expenses_trial_on
    AccountModulesExtension.new(driver).recruitment_trial_on
    AccountModulesExtension.new(driver).rota_trial_on
    AccountModulesExtension.new(driver).learn_trial_on
    puts '7b. switch on modules - chargable'
    AppNavigationExtensionManager.new(driver).navigate_to_settings_with_welcome_page_active
    NavigationAroundAccountConfiguration.new(driver).navigate_to_modules_free
    # NavigationAroundAccountConfiguration.new(driver).navigate_to_modules_chargable
    # issue with rta and learn disable button therefire WILL NEED MANUAL UPDATE IN UI UNTIL FIXED
    # AccountModulesExtension.new(driver).modules_chargable_switch_off
    # puts '7c. switch off modules - chargable'
    sleep 1
    AccountModulesExtension.new(driver).custom_fields
    puts '8. add a custom field'
    sleep 1
    # No long in the ui
    # AccountModulesExtension.new(driver).payroll_export_log_changes_only_on
    # puts '9a. switch on payroll exports'
    # AccountModulesExtension.new(driver).payroll_export_log_off
    # puts '9b. switch off payroll exports'
    AccountModulesExtension.new(driver).person_change_logs
    puts '10a. switch on change logs'
    sleep 1
    AccountModulesExtension.new(driver).person_change_logs
    puts '10b. switch off change logs'
    sleep 1
    AccountModulesExtension.new(driver).onboarding_tasks_on
    puts '11a. Turn on onboarding tasks'
    sleep 1
    AccountModulesExtension.new(driver).onboarding_tasks_off
    puts '11b. Turn off onboarding tasks'
    sleep 2
    AccountModulesExtension.new(driver).xero_payroll_integration_on
    puts '12a. switch on xero integration'
    sleep 1
    AccountModulesExtension.new(driver).xero_payroll_integration_off
    puts '12b. switch off xero integration'
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_to_picklist
    puts '13a. navigate to picklists'
    sleep 1
    PicklistContactExtension.new(driver).details_navigate_to_contract_type
    puts '13b. navigate to picklist - Contract types'
    sleep 1
    PicklistContactExtension.new(driver).details_contract_types_add
    puts '14a. Contract types - Add'
    sleep 1
    PicklistContactExtension.new(driver).details_contract_types_add_cancel
    puts '14b. Contract types - Cancel add new'
    sleep 1
    PicklistContactExtension.new(driver).details_contract_types_edit
    puts '14c. Contract type - Edit'
    sleep 1
    PicklistContactExtension.new(driver).details_contract_types_edit_cancel
    puts '14d. Contract type - Cancel Edit'
    sleep 1
    PicklistContactExtension.new(driver).details_contract_types_delete
    puts '14e. Contract type - Delete'
    sleep 1
    PicklistContactExtension.new(driver).details_contract_types_delete_cancel
    puts '14f. Contract type - Cancel delete'
    sleep 2
    PicklistContactExtension.new(driver).details_contract_type_add_return_breadcrumb
    puts '14g. Breadcrumb return from Contract type'
    sleep 1
    # NavigationAroundAccountConfiguration.new(driver).return_to_picklist_menu
    # puts '15a. retutn to picklists'
    # sleep 1
    PicklistGenderExtension.new(driver).navigate_to_gender
    puts '15b. navigate to genders'
    sleep 1
    PicklistGenderExtension.new(driver).details_genders_add
    puts '16a. Gender add new'
    sleep 1
    PicklistGenderExtension.new(driver).details_genders_edit
    puts '16b. Gender edit'
    sleep 1
    PicklistGenderExtension.new(driver).delete_gender
    puts '16c. Gender delete'
    sleep 1
    PicklistGenderExtension.new(driver).details_genders_return_breadcrumb
    puts '16d. Breadcrumb return to picklist Contract type'
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_to_email_notifications
    puts '17. navigate to Email notification'
    sleep 1
    EmailNotificationConfigExtension.new(driver).system_notifications_off
    puts '18a. System email notification Off'
    sleep 1
    EmailNotificationConfigExtension.new(driver).system_notifications_on
    puts '18b. System email notification On'
    sleep 1
    EmailNotificationConfigExtension.new(driver).third_party_email_invoice
    puts '18c. Email notification thid party invoice email'
    sleep 1
    EmailNotificationConfigExtension.new(driver).third_party_email_leave_request_approval
    puts '18d. Email notification thid party leave requests email'
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb_email_notification
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_to_woking_patterns
    puts '19. Navigate to Abscence settings - Working Patterns'
    sleep 1
    AccountWorkingPatternExtension.new(driver).working_pattern_add
    puts '20a. Working Pattern add'
    sleep 1
    AccountWorkingPatternExtension.new(driver).working_pattern_breadcrumb
    puts '20b. Working Pattern breadcrumb return to view'
    sleep 1
    AccountWorkingPatternExtension.new(driver).working_pattern_set_new_default
    puts '20c. Working Pattern set new default'
    sleep 1
    AccountWorkingPatternExtension.new(driver).working_pattern_edit
    puts '20d. Working Pattern edit'
    sleep 1
    AccountWorkingPatternExtension.new(driver).working_pattern_delete
    puts '20e. Working Pattern delete'
    sleep 1
    AccountWorkingPatternExtension.new(driver).working_pattern_show_inactive
    puts '20f. Working Pattern inactivate'
    sleep 1
    AccountWorkingPatternExtension.new(driver).working_pattern_search
    puts '20g. Working Pattern search'
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_to_holiday_allowances
    puts '21. Navigate to Abscence settings - holidays allowances'
    AccountHolidayAllowanceExtension.new(driver).holiday_allowances_add
    puts '22a. Holiday allowance add'
    AccountHolidayAllowanceExtension.new(driver).holiday_allowances_edit
    puts '22b. Holiday allowance edit'
    AccountHolidayAllowanceExtension.new(driver).holiday_allowances_delete
    puts '22c. Holiday allowance delete'
    sleep 1
    AccountHolidayAllowanceExtension.new(driver).holiday_allowances_select_default
    puts '22d. Holiday allowance select default'
    sleep 1
    AccountHolidayAllowanceExtension.new(driver).holiday_allowance_search
    puts '22e. Holiday allowance search' # what should this bring back if there is no allowance with a 'Z'
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb
    sleep 2
    NavigationAroundAccountConfiguration.new(driver).navigate_to_holiday_years
    puts '23. Navigate to Abscence settings - holidays years'
    sleep 2
    HolidayYearExtension.new(driver).edit_holiday_years_now
    puts '24. Holiday year edit year now'
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb
    sleep 2
    NavigationAroundAccountConfiguration.new(driver).navigate_to_company_holidays
    puts '25. Navigate to Abscence settings - company holidays'
    sleep 1
    CompanyHolidaysExtension.new(driver).company_holiday_add
    puts '26a. Company holiday add'
    sleep 1
    CompanyHolidaysExtension.new(driver).company_holiday_edit
    puts '26b. Company holiday edit'
    sleep 1
    CompanyHolidaysExtension.new(driver).company_holiday_delete
    puts '26c. Company holiday delete'
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb
    NavigationAroundAccountConfiguration.new(driver).navigate_to_company_blackout
    puts '27. Navigate to Abscence settings - company blackouts'
    CompanyBlackoutsExtension.new(driver).company_blackout_add_new
    puts '28a. Company blackouts add'
    CompanyBlackoutsExtension.new(driver).company_blackout_edit
    puts '28b. Company blackout edit'
    CompanyBlackoutsExtension.new(driver).company_blackout_delete
    puts '28c. Company blackouts delete'
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_to_api_setup
    puts '29. Navigate to Integrations - API setup'
    sleep 1
    # APIExtenion.new(driver).api_key_switch_on
    # puts '30a. Api switch on'
    # SHOULD ADD IN A CHECK AND EXPECTATION HERE
    APIExtenion.new(driver).api_key_switch_reset
    puts '30b. Api reset api key'
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_to_calendar_subscriptions
    puts '31. Navigate to Integrations - calendar subscriptions'
    sleep 1
    CalendarSubscriptionExtension.new(driver).calendar_central_setting_on
    sleep 1
    CalendarSubscriptionExtension.new(driver).add_department_list_item_one
    sleep 1
    CalendarSubscriptionExtension.new(driver).amend_calendar_revert_settings
    puts '32a. Calendar subscription managed centrally, added department and reset'
    sleep 1
    CalendarSubscriptionExtension.new(driver).calendar_allow_manage_own
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_to_calendar_subscriptions
    sleep 1
    CalendarSubscriptionExtension.new(driver).amend_calendar_revert_settings
    puts '32b. Calendar subscription managed by employees, added can see own calendar only and reset'
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_to_rota_cloud # add an expectation to check the screen
    puts '33. Navigate to Integrations - Rotacloud - Test manually if we need to cover this'
    sleep 1
    NavigationAroundAccountConfiguration.new(driver).navigate_back_to_settings_breadcrumb
    sleep 1
    driver.close
  end
end
# rubocop:enable Metrics/ClassLength
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
AccountSetup.new.test_account_setup
puts 'Test 1004 COMPLETE - PASS'
puts 'issue with rta and learn disable button therefore WILL NEED MANUAL UPDATE IN UI UNTIL FIXED'
