# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/sign_up_extension'
require './functions_library/navigate_around_app_manager'
require './functions_library/ui_page_element_check'
require './functions_library/test_reference_extension'
require './functions_library/settings_config/account_config_navigation/account_configuration_navigation_extension'
require './functions_library/buy_now_extension'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class TestBuyNow < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :firefox
    Selenium::WebDriver.logger.level = :info
  end

  def test_buy_now
    NavigateBrowserExtension.new(driver).breathe_signup_buy_now
    puts '1. Navigate to Sign Up Buy Now URL - Pass'
    sleep 0.5
    NavigateBrowserExtension.new(driver).cookie_modal_accept
    puts '2. Pop Up - Cookies - Accept - Pass'
    sleep 1
    SignUpExtension.new(driver).sign_up_std_positive
    puts '3. Sign Up Buy Now Std form - Pass'
    sleep 5
    BuyNowExtension.new(driver).buy_now_monthly_micro_no_modules_positive
    puts '4. Buy Now account becomes active (Micro / Monthly / No modules) - Pass'
    # PageValueCheck.new(driver).account_active
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize

TestBuyNow.new.test_buy_now
