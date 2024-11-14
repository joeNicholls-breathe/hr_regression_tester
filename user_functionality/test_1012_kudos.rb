# frozen_string_literal: true

require 'rspec'
require 'selenium-webdriver'
require 'logger'
require './functions_library/ui_page_element_check'
require './functions_library/test_reference_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/kudos_extension'
require './functions_library/navigate_around_app_employee'

class UserKudos < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_1012_user_kudos
    NavigateBrowserExtension.new(driver).breathe_login
    LoginExtension.new(driver).login_functionality_employee
    LoginAppExtension.new(driver).select_hr
    puts '1. - employee - login'
    KudosExtension.new(driver).create_kudos_individual
    # see methods for new way to navigate to dashboard widget buttons
    NavigateAroundAppEmployee.new(driver).navigate_to_dashboard_employee
    NavigateAroundAppEmployee.new(driver).navigate_to_leave_request_widget
    puts 'Test 1012 complete'
    driver.close
  end
end

UserKudos.new.test_1012_user_kudos
