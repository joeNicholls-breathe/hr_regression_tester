require 'selenium-webdriver'
require './functions_library/navigate_browser_extension.rb'
require './functions_library/sign_up_extension.rb'



class TestName
    attr_accessor :driver
    def initialize 
        @driver = Selenium::WebDriver.for :browser
    end

    def run_test
        begin
            ExtensionName.new(@driver).functionName 
            
        rescue => exception
            puts "Test - Output Name - Pass #{exception}"
        end

        driver.close
    end
end

TestName.new.run_test
