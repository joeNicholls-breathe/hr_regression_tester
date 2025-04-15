require 'rspec'
require 'selenium-webdriver'
require_relative '../functions_library/base'

RSpec.configure do |config|
  config.before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @driver.manage.timeouts.implicit_wait = 10
  end

  config.after(:each) do
    @driver.quit
  end
end

# Base class for performance tests
class BasePerformanceTest
  def initialize(driver)
    @driver = driver
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