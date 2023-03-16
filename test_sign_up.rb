require 'selenium-webdriver'
require './functions_library/navigate_browser_extension.rb'
require './functions_library/sign_up_extension.rb'

class TestSignUp
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def test_sign_up
    NavigateBrowserExtension.new(driver).breathe_signup
    NavigateBrowserExtension.new(driver).cookie_modal_accept
    SignUpExtension.new(driver).sign_up
    puts "Test - Sign Up - Pass"
    sleep 5
    driver.close
  end
end

TestSignUp.new.test_sign_up
