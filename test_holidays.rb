require 'selenium-webdriver'
require './functions_library/navigate_browser_extension.rb'
require './functions_library/login_extension.rb'
require './functions_library/login_app_extension.rb'
require './functions_library/holiday_extension.rb'

class TestHoliday
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def run_test
    begin
      NavigateBrowserExtension.new(driver).breathe_login
      puts "Navigate to Login Screen" 
      LoginExtension.new(driver).login_employee
      puts "Login to LoginApp as Admin"
      sleep 3
      LoginAppExtension.new(driver).select_hr
      puts "Navigate to HR using HR widget"
      sleep 3
      HolidayExtension.new(driver).holiday_request_dashboard_navigate_employee
   
   
    rescue => exception
      puts "Test - Sign Up - Pass #{exception}"
    end

    #driver.close
  end
end

TestHoliday.new.run_test
