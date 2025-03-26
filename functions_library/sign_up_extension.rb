# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/ClassLength
class SignUpExtension < Base
  def sign_up_std_positive
    driver.find_element(id: 'firstName').send_keys 'AdminStdSignUp'
    driver.find_element(id: 'lastName').send_keys 'User'
    driver.find_element(id: 'email').send_keys("admin#{random_number_string}@regressionaccount.com")
    driver.find_element(id: 'name').send_keys("Regression Account1 #{random_number_string}")
    drop = driver.find_element(id: 'numberOfEmployees')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, '21-50')
    driver.find_element(id: 'contactNumber').send_keys '01342 717123'
    driver.find_element(id: 'password').send_keys 'Password1'
    begin
      driver.find_element(id: 'account-terms-read').click
    rescue Selenium::WebDriver::Error::ElementClickInterceptedError
      driver.find_element(id: 'account-terms-read').click
    end
    begin
      driver.find_element(id: 'submit').click
    rescue Selenium::WebDriver::Error::ElementClickInterceptedError
      driver.find_element(id: 'submit').click
    end
  end

  def sign_up_negative_no_email
    driver.find_element(id: 'firstName').send_keys 'AdminStdSignUp'
    driver.find_element(id: 'lastName').send_keys 'User'
    driver.find_element(id: 'name').send_keys("Regression Account1 #{random_number_string}")
    drop = driver.find_element(id: 'numberOfEmployees')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, '21-50')
    driver.find_element(id: 'contactNumber').send_keys '01342 717123'
    driver.find_element(id: 'password').send_keys 'Password1'
    begin
      driver.find_element(id: 'account-terms-read').click
    rescue Selenium::WebDriver::Error::ElementClickInterceptedError
      driver.find_element(id: 'account-terms-read').click
    end
    begin
      driver.find_element(id: 'submit').click
    rescue Selenium::WebDriver::Error::ElementClickInterceptedError
      driver.find_element(id: 'submit').click
    end
  end

  def sign_up_negative_no_account_name
    driver.find_element(id: 'firstName').send_keys 'AdminStdSignUp'
    driver.find_element(id: 'lastName').send_keys 'User'
    driver.find_element(id: 'email').send_keys("admin#{random_number_string}@regressionaccount.com")
    drop = driver.find_element(id: 'numberOfEmployees')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, '21-50')
    driver.find_element(id: 'contactNumber').send_keys '01342 717123'
    driver.find_element(id: 'password').send_keys 'Password1'
    begin
      driver.find_element(id: 'account-terms-read').click
    rescue Selenium::WebDriver::Error::ElementClickInterceptedError
      driver.find_element(id: 'account-terms-read').click
    end
    begin
      driver.find_element(id: 'submit').click
    rescue Selenium::WebDriver::Error::ElementClickInterceptedError
      driver.find_element(id: 'submit').click
    end
  end

  def sign_up_negative_no_account_employees
    driver.find_element(id: 'firstName').send_keys 'AdminStdSignUp'
    driver.find_element(id: 'lastName').send_keys 'User'
    driver.find_element(id: 'email').send_keys("admin#{random_number_string}@regressionaccount.com")
    driver.find_element(id: 'name').send_keys("Regression Account1 #{random_number_string}")
    driver.find_element(id: 'contactNumber').send_keys '01342 717123'
    driver.find_element(id: 'password').send_keys 'Password1'
    begin
      driver.find_element(id: 'account-terms-read').click
    rescue Selenium::WebDriver::Error::ElementClickInterceptedError
      driver.find_element(id: 'account-terms-read').click
    end
    begin
      driver.find_element(id: 'submit').click
    rescue Selenium::WebDriver::Error::ElementClickInterceptedError
      driver.find_element(id: 'submit').click
    end
  end

  def sign_up_negative_no_telephone_number
    driver.find_element(id: 'firstName').send_keys 'AdminStdSignUp'
    driver.find_element(id: 'lastName').send_keys 'User'
    driver.find_element(id: 'email').send_keys("admin#{random_number_string}@regressionaccount.com")
    driver.find_element(id: 'name').send_keys("Regression Account1 #{random_number_string}")
    drop = driver.find_element(id: 'numberOfEmployees')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, '21-50')
    driver.find_element(id: 'password').send_keys 'Password1'
    begin
      driver.find_element(id: 'account-terms-read').click
    rescue Selenium::WebDriver::Error::ElementClickInterceptedError
      driver.find_element(id: 'account-terms-read').click
    end
    begin
      driver.find_element(id: 'submit').click
    rescue Selenium::WebDriver::Error::ElementClickInterceptedError
      driver.find_element(id: 'submit').click
    end
  end

  def sign_up_negative_no_password_one
    driver.find_element(id: 'firstName').send_keys 'AdminStdSignUp'
    driver.find_element(id: 'lastName').send_keys 'User'
    driver.find_element(id: 'email').send_keys("admin#{random_number_string}@regressionaccount.com")
    driver.find_element(id: 'name').send_keys("Regression Account1 #{random_number_string}")
    drop = driver.find_element(id: 'numberOfEmployees')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, '21-50')
    driver.find_element(id: 'contactNumber').send_keys '01342 717123'
    begin
      driver.find_element(id: 'account-terms-read').click
    rescue Selenium::WebDriver::Error::ElementClickInterceptedError
      driver.find_element(id: 'account-terms-read').click
    end
    begin
      driver.find_element(id: 'submit').click
    rescue Selenium::WebDriver::Error::ElementClickInterceptedError
      driver.find_element(id: 'submit').click
    end
  end

  def sign_up_negative_no_password_two
    driver.find_element(id: 'firstName').send_keys 'AdminStdSignUp'
    driver.find_element(id: 'lastName').send_keys 'User'
    driver.find_element(id: 'email').send_keys("admin#{random_number_string}@regressionaccount.com")
    driver.find_element(id: 'name').send_keys("Regression Account1 #{random_number_string}")
    drop = driver.find_element(id: 'numberOfEmployees')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, '21-50')
    driver.find_element(id: 'contactNumber').send_keys '01342 717123'
    driver.find_element(id: 'password').send_keys 'Password1'
    begin
      driver.find_element(id: 'account-terms-read').click
    rescue Selenium::WebDriver::Error::ElementClickInterceptedError
      driver.find_element(id: 'account-terms-read').click
    end
    begin
      driver.find_element(id: 'submit').click
    rescue Selenium::WebDriver::Error::ElementClickInterceptedError
      driver.find_element(id: 'submit').click
    end
  end

  def sign_up_login_button
    element = driver.find_element(id: 'linkSignupBody1')
    driver.execute_script('arguments[0].scrollIntoView(true);', element)
    sleep 0.5
    driver.find_element(id: 'linkSignupBody1').click
  end

  def logo_to_website
    driver.find_element(xpath: '/html/body/div[1]/nav/div/div/div[1]').click
  end
end
# rubocop:enable Metrics/ClassLength
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
