# frozen_string_literal: true

require 'selenium-webdriver'
require File.expand_path('functions_library/base.rb', __dir__)
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'

class TestLoginHr < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def login_in
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Navigate to Login Screen'
    LoginExtension.new(driver).login_admin
    puts 'Login to LoginApp as Admin'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Navigate to HR using HR widget'
    puts 'Test - Log in - Pass'
  end
end

TestLoginHr.new.login_in
