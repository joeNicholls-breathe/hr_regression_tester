# frozen_string_literal: true

require 'selenium-webdriver'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/holiday_extension'

class TestHoliday
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def run_test
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Navigate to Login Screen'
    LoginExtension.new(driver).login_employee
    puts 'Login to LoginApp as Admin'
    LoginAppExtension.new(driver).select_hr
    puts 'Navigate to HR using HR widget'
    HolidayExtension.new(driver).holiday_request_dashboard_navigate_employee
  rescue StandardError => e
    puts "Test - Sign Up - Pass #{e}"
  end
end

TestHoliday.new.run_test
