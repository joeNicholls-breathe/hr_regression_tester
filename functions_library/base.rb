# frozen_string_literal: true

require 'selenium-webdriver'
require 'roo'
require_relative '../settings'
require './functions_library/test_reference_extension'
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
    Selenium::WebDriver::Wait.new(timeout: 3)
  end
end
