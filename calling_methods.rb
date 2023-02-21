require 'selenium-webdriver'
require './functions_library/navigate_browser_extension.rb'
require './functions_library/login_extension.rb'
require './functions_library/login_app_extension.rb'



class TestOne
    attr_accessor :driver
    def initialize 
        @driver = Selenium::WebDriver.for :chrome
    end

    def run_test_login
        begin
            NavigateBrowserExtension.new(@driver).breathe_login
            LoginExtension.new(@driver).login_fail
            LoginAppExtension.new(@driver).select_hr
        rescue => exception
            puts "test one failed #{exception}"
            NavigateBrowserExtension.new(@driver).breathe_login
            LoginExtension.new(@driver).login_pass
            LoginAppExtension.new(@driver).select_hr     
            sleep 5
        end

                
        driver.close
    end
end

TestOne.new.run_test_login
