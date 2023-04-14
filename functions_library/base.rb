require 'selenium-webdriver'
require_relative '../settings.rb'
require 'pry'

class Base
  include Settings

  attr_accessor :driver

  def initialize(driver)
    @driver = driver
  end

  def wait
    wait = Selenium::WebDriver::Wait.new(timeout: 3)
  end
end
