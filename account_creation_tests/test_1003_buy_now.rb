# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/sign_up_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/ui_page_element_check_extension'
require './functions_library/test_reference_extension'
require './functions_library/settings_config/account_config_navigation/account_configuration_navigation_extension'
require './functions_library/buy_now_extension'
require './functions_library/cancel_extension'
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class TestBuyNow < Base
  attr_accessor :driver

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for :chrome, options: options
    Selenium::WebDriver.logger.level = :info
  end

  def test_buy_now
    NavigateBrowserExtension.new(driver).breathe_signup_buy_now
    puts '1. Navigate to Sign Up Buy Now URL - Pass'
    sleep 0.5
    # NavigateBrowserExtension.new(driver).cookie_modal_accept
    # puts '1a. Pop Up - Cookies - Accept - Pass'
    sleep 1
    SignUpExtension.new(driver).sign_up_std_positive
    puts '2. Sign Up Buy Now Std form - Pass'
    sleep 20 # for the recapatcha and remove gravatar use from account
    BuyNowExtension.new(driver).buy_now_monthly_micro_no_modules_positive
    puts '3. Buy Now account becomes active (Micro / Monthly / No modules) - Pass'
    CancelPLanExtension.new(driver).cancel_account
    driver.close
    # PageValueCheck.new(driver).account_active
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
TestBuyNow.new.test_buy_now
puts 'Test 1003 COMPLETE - PASS'
