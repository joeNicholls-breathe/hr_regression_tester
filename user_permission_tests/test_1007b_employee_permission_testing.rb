# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/ui_page_element_check'
require './functions_library/test_reference_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_employee'
require './functions_library/sickness_extension'
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class EmployeePermissions < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_1007b_employee_permissions_testing
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).login_auto_approval_permissions_employee
    puts 'employee login'
    LoginAppExtension.new(driver).select_hr
    puts 'navigate to HR'
    NavigateAroundAppEmployee.new(driver).navigate_to_profile
    NavigateAroundAppEmployee.new(driver).edit_profile_summary
    puts 'edit profile summary - change request submitted'
    NavigateAroundAppEmployee.new(driver).navigate_to_pay
    puts 'access to view pay'
    NavigateAroundAppEmployee.new(driver).navigate_to_benefits
    puts 'access to view benefits'
    NavigateAroundAppEmployee.new(driver).navigate_to_additional_payments
    puts 'access to view additional payments'
    NavigateAroundAppEmployee.new(driver).navigate_to_performance_onetoone
    NavigateAroundAppEmployee.new(driver).navigate_to_performance_objectives
    NavigateAroundAppEmployee.new(driver).navigate_to_performance_deliverables
    puts 'access to view performance metrics'
    NavigateAroundAppEmployee.new(driver).navigate_to_custom_fields
    puts 'access to view custom fields'
    NavigateAroundAppEmployee.new(driver).navigate_to_directory
    puts 'access to view directory'
    NavigateAroundAppEmployee.new(driver).navigate_to_calendar
    puts 'access to view calendar'
    # NavigateAroundAppEmployee.new(driver).navigate_to_holidays
    # NavigateAroundAppEmployee.new(driver).request_toil
    # puts 'request TOIL'
    NavigateAroundAppEmployee.new(driver).open_sickness_new
    SicknessExtension.new(driver).employee_sickness_create
    puts 'request sickness - form'
    NavigateAroundAppEmployee.new(driver).open_request_onetoeone_new
    NavigateAroundAppEmployee.new(driver).one_to_one_request
    puts 'request one to one - dashboard'
    LogoutExtension.new(driver).user_logout
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
EmployeePermissions.new.test_1007b_employee_permissions_testing
