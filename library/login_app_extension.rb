require 'selenium-webdriver'

class LoginAppExtension
    attr_accessor :driver
    def initialize(driver)
         @driver = driver
    end

    def select_hr
        driver.find_element(class: 'hr').click
    end

    private 

    attr_reader :driver
end 