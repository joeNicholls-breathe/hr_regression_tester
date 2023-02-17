require 'selenium-webdriver'
require './navigate_browser_extension.rb'
require './login_extension.rb'
require './login_app_extension.rb'



class TestOne
    attr_accessor :driver
    def initialize 
        @driver = Selenium::WebDriver.for :chrome
    end

    def run_test_login
        begin
            NavigateBrowserExtension.new(@driver).breathe
            LoginExtension.new(@driver).login_fail
            LoginAppExtension.new(@driver).select_hr
        rescue => exception
            puts "test one failed #{exception}"
            NavigateBrowserExtension.new(@driver).breathe
            LoginExtension.new(@driver).login_pass
            LoginAppExtension.new(@driver).select_hr     
        end

        begin
            NavigateBrowserExtension.new(@driver).breathe
            LoginExtension.new(@driver).login_fail
            LoginAppExtension.new(@driver).select_hr
        rescue => exception
            puts "test one failed #{exception}"
            NavigateBrowserExtension.new(@driver).breathe
            LoginExtension.new(@driver).login_pass
            LoginAppExtension.new(@driver).select_hr     
        end


        
        driver.close
    end
end

TestOne.new.run_test_login
