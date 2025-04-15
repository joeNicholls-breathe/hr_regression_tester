# frozen_string_literal: true

require 'selenium-webdriver'
require 'rspec'
require 'roo'
require 'date'
require_relative '../settings'
require './functions_library/test_reference_extension'
require 'pry'

class Base
  include Settings
  include TestRefExtension

  attr_accessor :driver

  def initialize(driver)
    @driver = driver
    @driver.manage.timeouts.implicit_wait = 10
    @sleep_time_long = (ENV['SLEEPTIME_LONG'] || 4).to_f
    @sleep_time_short = (ENV['SLEEPTIME_SMALL'] || 1).to_f
  end

  def wait
    Selenium::WebDriver::Wait.new(timeout: 10)
  end

  def measure_execution_time(&block)
    start_time = Time.now
    yield
    end_time = Time.now
    execution_time = end_time - start_time
    puts "Execution time: #{execution_time} seconds"
    execution_time
  end
end
