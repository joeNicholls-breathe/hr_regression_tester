require 'selenium-webdriver'
require 'pry'

class LoginExtension
        attr_accessor :driver
        def initialize(driver)
             @driver = driver
        end
        
        def login_pass
                driver.find_element(id: 'email-input').send_keys "admin@ocun.com"
                sleep 1
                driver.find_element(name: 'password').send_keys "Password1"
                sleep 1
                driver.find_element(css: 'form button[type=submit]').click 
                sleep 1
        end       

        def login_fail
                driver.find_element(id: 'email-input').send_keys "admin@ocun.com"
                sleep 1
                driver.find_element(name: 'password').send_keys "Fail to login"
                sleep 1
                driver.find_element(css: 'form button[type=submit]').click 
                sleep 1
        end   

        private 

        attr_reader :driver
end
