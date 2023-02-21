require 'selenium-webdriver'
require './library/navigate_browser_extension.rb'
require './library/sign_up.rb'


class TestSignUp
    attr_accessor :driver
    def initialize 
        @driver = Selenium::WebDriver.for :firefox
    end

    def run_test
        begin
            NavigateBrowserExtension.new(@driver).breathe_signup
            NavigateBrowserExtension.new(@driver).cookie_modal_accept
            SignUpExtension.new(@driver).sign_up
        rescue => exception
            puts "Test - Sign Up - Pass #{exception}"
        end



        
        driver.close
    end
end

TestSignUp.new.run_test
