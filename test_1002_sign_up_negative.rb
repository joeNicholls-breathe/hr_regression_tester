# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/sign_up_extension'
require './functions_library/ui_page_element_check'
require './functions_library/test_reference_extension'

class TestSignUpNegative < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_sign_up_negative_email
    NavigateBrowserExtension.new(driver).breathe_signup
    NavigateBrowserExtension.new(driver).cookie_modal_accept
    SignUpExtension.new(driver).sign_up_negative_no_email
    PageValueCheck.new(driver).signup_fail_check
    sleep 0.5
    puts 'NT - No email - test run'
    driver.close
  end

  def test_sign_up_negative_no_account_name
    NavigateBrowserExtension.new(driver).breathe_signup
    NavigateBrowserExtension.new(driver).cookie_modal_accept
    SignUpExtension.new(driver).sign_up_negative_no_account_name
    PageValueCheck.new(driver).signup_fail_check
    sleep 0.5
    puts 'NT - No account name - test run'
    driver.close
  end

  def test_sign_up_negative_no_account_employees
    NavigateBrowserExtension.new(driver).breathe_signup
    NavigateBrowserExtension.new(driver).cookie_modal_accept
    SignUpExtension.new(driver).sign_up_negative_no_account_employees
    PageValueCheck.new(driver).signup_fail_check
    sleep 0.5
    puts 'NT - No plan size chosen - test run'
    driver.close
  end

  def sign_up_negative_no_telephone_number
    NavigateBrowserExtension.new(driver).breathe_signup
    NavigateBrowserExtension.new(driver).cookie_modal_accept
    SignUpExtension.new(driver).sign_up_negative_no_telephone_number
    PageValueCheck.new(driver).signup_fail_check
    sleep 0.5
    puts 'NT - No telepone number entered - test run'
    driver.close
  end

  def sign_up_negative_no_password_one
    NavigateBrowserExtension.new(driver).breathe_signup
    NavigateBrowserExtension.new(driver).cookie_modal_accept
    SignUpExtension.new(driver).sign_up_negative_no_password_one
    PageValueCheck.new(driver).signup_fail_check
    sleep 0.5
    puts 'NT - No password (1) entered - test run'
    driver.close
  end

  def sign_up_negative_no_password_two
    NavigateBrowserExtension.new(driver).breathe_signup
    NavigateBrowserExtension.new(driver).cookie_modal_accept
    SignUpExtension.new(driver).sign_up_negative_no_password_two
    PageValueCheck.new(driver).signup_fail_check
    sleep 0.5
    puts 'NT - No password (2) entered - test run'
    driver.close
  end
end

TestSignUpNegative.new.test_sign_up_negative_email
TestSignUpNegative.new.test_sign_up_negative_no_account_name
TestSignUpNegative.new.test_sign_up_negative_no_account_employees
TestSignUpNegative.new.sign_up_negative_no_telephone_number
TestSignUpNegative.new.sign_up_negative_no_password_one
TestSignUpNegative.new.sign_up_negative_no_password_two
