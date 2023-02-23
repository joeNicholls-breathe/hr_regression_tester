require 'selenium-webdriver'
require_relative '../settings.rb'
require 'pry'

class Extension
    include Settings
    
    attr_accessor :driver
    
    def initialize(driver)
         @driver = driver
    end

    def function_name
        driver.find_element(:'').click
        driver.find_element(:'').send_keys ""
    end
end
