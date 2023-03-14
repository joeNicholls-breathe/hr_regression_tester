require 'selenium-webdriver'
require './test_sign_up.rb'
require './test_login.rb'
require './test_bulk_upload.rb'

class TestOne
attr_accessor :driver
  def initialize 
    #@driver = Selenium::WebDriver.for :chrome
  end

  def run_test_account_create
    begin
        #test_sign_up.new
        test_login.new
        test_bulk_upload.new
    rescue => exception
        puts "test one - Pass #{exception}"
        sleep 5
    end

    driver.close
    end
end

TestOne.new.run_test_account_create
