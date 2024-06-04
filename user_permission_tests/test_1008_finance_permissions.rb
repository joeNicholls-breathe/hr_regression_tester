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
    LogoutExtension.new(driver).user_logout
    driver.close
  end
end

FinancePermissions.new.test_1008_finance_permissions
