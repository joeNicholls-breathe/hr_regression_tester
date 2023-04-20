require 'selenium-webdriver'
require './functions_library/navigate_browser_extension.rb'
require './functions_library/navigate_around_app_manager.rb'
require './functions_library/test_page_check.rb'
require './functions_library/test_reference_extension.rb'

class TestLineManager
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_line_manager



    driver.close
  end
end

TestLineManager.new.test_line_manager