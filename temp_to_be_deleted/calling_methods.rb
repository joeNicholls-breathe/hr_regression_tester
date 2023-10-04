# frozen_string_literal: true

require 'selenium-webdriver'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'

class TestAccountCreation
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def run_test_login
    begin
      NavigateBrowserExtension.new(@driver).breathe_login
      LoginExtension.new(@driver).login_fail
      LoginAppExtension.new(@driver).select_hr
    rescue StandardError => e
      puts "test one failed #{e}"
      sleep 5
    end

    driver.close
  end
end

TestOne.new.run_test_login
