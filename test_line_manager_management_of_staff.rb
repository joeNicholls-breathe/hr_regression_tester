# frozen_string_literal: true

require 'selenium-webdriver'
require './functions_library/navigate_browser_extension'
require './functions_library/navigate_around_app_manager'
require './functions_library/test_page_check'
require './functions_library/test_reference_extension'

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
