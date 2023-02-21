require 'selenium-webdriver'

class Extension
    attr_accessor :driver
    def initialize(driver)
         @driver = driver
    end

    def function_name
        driver.find_element(:'').click

        driver.find_element(:'').send_keys ""


    end

    private 

    attr_reader :driver
end