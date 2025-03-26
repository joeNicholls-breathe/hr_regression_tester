# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/sign_up_extension'
require './functions_library/ui_page_element_check_extension'
require './functions_library/test_reference_extension'

class TestSignUpNegative < Base
  attr_accessor :driver

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  def test_sign_up_negative_email
    NavigateBrowserExtension.new(driver).breathe_signup
    # NavigateBrowserExtension.new(driver).cookie_modal_accept
    SignUpExtension.new(driver).sign_up_negative_no_email
    PageValueCheck.new(driver).signup_fail_check
    sleep 0.5
    puts '1. NT - No email - test run'
    driver.close
  end

  def test_sign_up_negative_no_account_name
    NavigateBrowserExtension.new(driver).breathe_signup
    # NavigateBrowserExtension.new(driver).cookie_modal_accept
    SignUpExtension.new(driver).sign_up_negative_no_account_name
    PageValueCheck.new(driver).signup_fail_check
    sleep 0.5
    puts '2. NT - No account name - test run'
    driver.close
  end

  def test_sign_up_negative_no_account_employees
    NavigateBrowserExtension.new(driver).breathe_signup
    # NavigateBrowserExtension.new(driver).cookie_modal_accept
    SignUpExtension.new(driver).sign_up_negative_no_account_employees
    PageValueCheck.new(driver).signup_fail_check
    sleep 0.5
    puts '3. NT - No plan size chosen - test run'
    driver.close
  end

  def sign_up_negative_no_telephone_number
    NavigateBrowserExtension.new(driver).breathe_signup
    # NavigateBrowserExtension.new(driver).cookie_modal_accept
    SignUpExtension.new(driver).sign_up_negative_no_telephone_number
    PageValueCheck.new(driver).signup_fail_check
    sleep 0.5
    puts '4. NT - No telepone number entered - test run'
    driver.close
  end

  def sign_up_negative_no_password_one
    NavigateBrowserExtension.new(driver).breathe_signup
    # NavigateBrowserExtension.new(driver).cookie_modal_accept
    SignUpExtension.new(driver).sign_up_negative_no_password_one
    PageValueCheck.new(driver).signup_fail_check
    sleep 0.5
    puts '5. NT - No password (1) entered - test run'
    driver.close
  end

  def sign_up_negative_no_password_two
    NavigateBrowserExtension.new(driver).breathe_signup
    # NavigateBrowserExtension.new(driver).cookie_modal_accept
    SignUpExtension.new(driver).sign_up_negative_no_password_two
    PageValueCheck.new(driver).signup_fail_check
    sleep 0.5
    puts '6. NT - No password (2) entered - test run'
    driver.close
  end
end

TestSignUpNegative.new.test_sign_up_negative_email
TestSignUpNegative.new.test_sign_up_negative_no_account_name
TestSignUpNegative.new.test_sign_up_negative_no_account_employees
TestSignUpNegative.new.sign_up_negative_no_telephone_number
TestSignUpNegative.new.sign_up_negative_no_password_one
TestSignUpNegative.new.sign_up_negative_no_password_two
puts 'Test 1002 COMPLETE - PASS'
