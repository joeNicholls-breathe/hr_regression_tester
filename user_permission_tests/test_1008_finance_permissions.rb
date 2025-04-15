# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/ui_page_element_check_extension'
require './functions_library/test_reference_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_finance_user_extension'
require './functions_library/logout_extension'

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
class FinancePermissions < Base
  attr_accessor :driver

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  def test_1008_finance_permissions
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).login_setup_acc_finance_user
    LoginAppExtension.new(driver).select_hr
    puts '1. finance user log in'
    AppNavigationExtensionFinance.new(driver).finance_people_list
    puts '2. access people list'
    AppNavigationExtensionFinance.new(driver).filter_people_list_employees_only
    PageValueCheck.new(driver).show_number_of_employees_on_people_list
    puts '3. filters on people list'
    AppNavigationExtensionFinance.new(driver).bulk_assign_pension_all_employees
    puts '4. bulk assign - benefit - pension'
    AppNavigationExtensionFinance.new(driver).finance_change_plan
    puts '5. change plan'
    AppNavigationExtensionFinance.new(driver).update_billing_details
    puts '6. update billing details'
    AppNavigationExtensionFinance.new(driver).check_billing_history
    PageValueCheck.new(driver).billing_history
    # Need to add in a check here to see if the invoices figures are consitent with expectation
    puts '7. check billing history - last invoice open and viewable'
    AppNavigationExtensionFinance.new(driver).finance_return_to_previous_plan
    puts '8. return plan change back to monthly, reset test'
    AppNavigationExtensionFinance.new(driver).finance_user_report_check
    # Add in an expectation to check that the report shows the data
    puts '9. reports view and check'
    sleep 1
    LogoutExtension.new(driver).user_logout
    driver.close
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
puts 'Test 1008 Finance permissions - std perms function testing'
FinancePermissions.new.test_1008_finance_permissions
puts 'Test 1008 Finance permissions test COMPLETE - PASS'
