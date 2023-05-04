require 'selenium-webdriver'
require './functions_library/test_page_check.rb'
require './functions_library/test_reference_extension.rb'
require './functions_library/login_extension.rb'
require './functions_library/login_app_extension.rb'
require './functions_library/navigate_browser_extension.rb'
require './functions_library/navigate_around_app_manager.rb'

class AccountSetup
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_account_setup
    LoginExtension.login_admin
    LoginAppExtension.select_hr
    puts "login"
    AppNavigationExtensionManager.navigate_to_settings
    puts "navigate to configuration settings"
    AccountConfigExtension.navigate_to_company_details
    AccountConfigExtension.company_details_data_entry_edit
    AccountConfigExtension.navigate_back_to_settings_breadcrumb
    puts "enter company details"
    AccountConfigExtension.navigate_to_modules_chargable
    AccountConfigExtension.modules_chargable_switch_on
    puts "switch on modules - chargable"
    AccountConfigExtension.navigate_to_modules_free
    AccountConfigExtension.modules_free_switch_on
    puts "switch on modules - free"
    AccountConfigExtension.custom_fields
    puts "add a custom field"
    AccountConfigExtension.payroll_export_log_changes_only
    puts "switch on payroll exports"
    AccountConfigExtension.person_change_logs
    puts "switch on change logs"
    AccountConfigExtension.onboarding_tasks_on
    puts "add onboarding tasks for employee"
    AccountConfigExtension.xero_payroll_integration
    puts "switch on xero integration *might want to do this as the buy now journey"
    AccountConfigExtension.navigate_to_picklist
    puts "navigate to picklists"
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    AccountConfigExtension
    puts "Picklist details add/edit/delete/search/breadcrumb"

    puts "Picklist absence add/edit/delete/search/breadcrumb"
    
    puts "Picklist training add/edit/delete/search/breadcrumb"

    puts "Picklist company organisation add/edit/delete/search/breadcrumb"

    puts "Piclist pay and benefits add/edit/delete/search/breadcrumb"

    puts "Pickilst recruitment add/edit/delete/search/breadcrumb"

    puts "Picklist performance management add/edit/delete/search/breadcrumb"

    puts "Email notification set up add/edit/delete/search/breadcrumb"

    puts "Permissions and approvals of HR/Line Managers and employees add/edit/delete/search/breadcrumb" 

    puts "abscence settings - holidays and working patterns (adding new and editing away from the default)"

    puts "check what people can do - employee"

    puts "check what people can do - Line manager"

    puts "check what people can do - HR user"

    puts "security 2fa"

    puts "add line manager to account"

    puts "add employee to account"

    puts "assign permissions to employees"

    puts "assign line managers to employees"
  
    driver.close
  end
end

AccountSetup.new.test_account_setup