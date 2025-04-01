# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/ui_page_element_check'
require './functions_library/test_reference_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_finance_user'
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
    LoginExtension.new(driver).finance_login
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
    puts '7. check billing history - last invoice open and viewable'
    AppNavigationExtensionFinance.new(driver).finance_return_to_previous_plan
    puts '8. return plan change back to monthly, reset test'
    AppNavigationExtensionFinance.new(driver).finance_user_report_check
    puts '9. reports view and check'
    LogoutExtension.new(driver).user_logout
    driver.close
  end
end
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
FinancePermissions.new.test_1008_finance_permissions
puts 'Test 1008 Finance permissions test complete'
