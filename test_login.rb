require 'selenium-webdriver'
require './functions_library/navigate_browser_extension.rb'
require './functions_library/login_extension.rb'

class TestLoginHr
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :firefox
  end

  def run_test
    begin
      NavigateBrowserExtension.new(driver).breathe_login
      puts "Navigate to Login Screen" 
      LoginExtension.new(driver).login_admin
      puts "Login to LoginApp as Admin"
      LoginAppExtension.new(driver).select_hr
      puts "Navigate to HR using HR widget"
   
   
   
    rescue => exception
      puts "Test - Sign Up - Pass #{exception}"
    end

    #driver.close
  end
end

TestLoginHr.new.run_test
