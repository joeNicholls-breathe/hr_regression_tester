require 'selenium-webdriver'
require_relative '../settings.rb'
require './functions_library/test_reference_extension.rb'
require 'pry'

class Base
  include Settings
  include TestRefExtension

  attr_accessor :driver

  def initialize(driver)
    @driver = driver 
    @driver.manage.timeouts.implicit_wait = 3
  end

  def wait
    wait = Selenium::WebDriver::Wait.new(timeout: 3)
  end
end
