# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/test_reference_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'

class FinancePermissions < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_1008_finance_permissions
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).finance_login
    LoginAppExtension.new(driver).select_hr
    AppNavigationExtensionManager.new(driver).navigate_to_dashboard
    puts "finance user log in"
    puts "access people list"
    puts "filters on people list"
    puts "bulk assign - benefit - pension"
    puts "bulk assign - people type"
    puts "change plan"
    puts "update billing details"
    puts "check billing history - last invoice open and viewable"
    puts "reports view and check"
    puts "data imports ??"
    LogoutExtension.new(driver).user_logout
    driver.close
  end
end

FinancePermissions.new.test_1008_finance_permissions
