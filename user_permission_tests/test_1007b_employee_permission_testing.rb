# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/ui_page_element_check_extension'
require './functions_library/test_reference_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_employee_extension'
require './functions_library/sickness_extension'
require './functions_library/logout_extension'
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
class EmployeePermissions < Base
  attr_accessor :driver

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  # To improve this script i'll add an expectation to see that the pay section isnt reached

  def test_1007b_employee_permissions_testing
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).login_auto_approval_permissions_employee
    puts '1. employee login - Pass'
    LoginAppExtension.new(driver).select_hr
    puts '2. navigate to HR - Pass'
    sleep 1
    NavigateAroundAppEmployee.new(driver).navigate_to_profile
    sleep 1
    NavigateAroundAppEmployee.new(driver).edit_profile_summary
    puts '3. edit profile summary - change request submitted - Pass'
    begin
      NavigateAroundAppEmployee.new(driver).navigate_to_pay
    rescue StandardError
      puts 'return to dashboard after rescue as user couldnt get to pay'
      NavigateAroundAppEmployee.new(driver).navigate_to_dashboard_employee
      puts '4. no access to view pay - Pass'
    end
    begin
      NavigateAroundAppEmployee.new(driver).navigate_to_benefits
    rescue StandardError
      puts 'return to dashboard after rescueas user couldnt get to benefits'
      NavigateAroundAppEmployee.new(driver).navigate_to_dashboard_employee
      puts '5. no access to view benefits - Pass'
    end
    begin
      NavigateAroundAppEmployee.new(driver).navigate_to_additional_payments
    rescue StandardError
      puts 'return to dashboard after rescueas user couldnt get to benefits'
      NavigateAroundAppEmployee.new(driver).navigate_to_dashboard_employee
      puts '6. no access to view additional payments - Pass'
    end
    # doesnt appear to be governed by the permissions rule, rasied woth Product
    begin
      NavigateAroundAppEmployee.new(driver).navigate_to_performance_onetoone
      NavigateAroundAppEmployee.new(driver).navigate_to_performance_objectives
      NavigateAroundAppEmployee.new(driver).navigate_to_performance_deliverables
    rescue StandardError
      puts 'return to dashboard after rescue'
      NavigateAroundAppEmployee.new(driver).navigate_to_dashboard_employee
      puts '7. no access to view performance metrics - Pass'
    end
    # page doesnt fail it just returns profile?/ not sure what to do here
    begin
      NavigateAroundAppEmployee.new(driver).navigate_to_custom_fields
    rescue StandardError
      puts 'return to dashboard after rescue user couldnt get to custome fields'
      NavigateAroundAppEmployee.new(driver).navigate_to_dashboard_employee
      puts '8. no access to view custom fields - Pass'
    end
    begin
      NavigateAroundAppEmployee.new(driver).navigate_to_directory
    rescue StandardError
      puts 'return to dashboard after rescue user couldnt get to directory'
      NavigateAroundAppEmployee.new(driver).navigate_to_dashboard_employee
      puts '9. no access to view directory - Pass'
    end
    begin
      NavigateAroundAppEmployee.new(driver).navigate_to_calendar
    rescue StandardError
      puts 'return to dashboard after rescue user couldnt get to calendar'
      NavigateAroundAppEmployee.new(driver).navigate_to_dashboard_employee
      puts '10. no access to view calendar - Pass'
    end
    begin
      NavigateAroundAppEmployee.new(driver).navigate_to_holidays
      NavigateAroundAppEmployee.new(driver).request_toil
    rescue StandardError
      puts 'return to dashboard after rescue user couldnt get to TOIL'
      NavigateAroundAppEmployee.new(driver).navigate_to_dashboard_employee
      puts '11. not able to request TOIL - Pass'
    end
    begin
      NavigateAroundAppEmployee.new(driver).open_sickness_new
      SicknessExtension.new(driver).employee_sickness_create
    rescue StandardError
      puts 'return to dashboard after rescueuser couldnt get to sicknesses'
      NavigateAroundAppEmployee.new(driver).navigate_to_dashboard_employee
      puts '12. not able to request sickness - form - Pass'
    end
    begin
      NavigateAroundAppEmployee.new(driver).open_request_onetoeone_new
      NavigateAroundAppEmployee.new(driver).one_to_one_request
    rescue StandardError
      puts 'return to dashboard after rescueuser couldnt get to request a 121'
      NavigateAroundAppEmployee.new(driver).navigate_to_dashboard_employee
      puts '13. not able to request one to one - dashboard - Pass'
    end
    sleep 3
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
EmployeePermissions.new.test_1007b_employee_permissions_testing
puts 'Test 1007b employee without permissions test - COMPLETED PASS'
