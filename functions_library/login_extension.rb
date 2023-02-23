require 'selenium-webdriver'
require_relative '../settings.rb'

class LoginExtension
        include Settings

        attr_accessor :driver
        
        def initialize(driver)
                @driver = driver
        end
        
        def login_pass
                driver.find_element(id: 'email-input').send_keys settings[:staging][:test_direct_admin_email]
                sleep 1
                driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
                sleep 1
                driver.find_element(css: 'form button[type=submit]').click 
                sleep 1
        end       

        def login_fail
                driver.find_element(id: 'email-input').send_keys settings[:staging][:test_direct_admin_email]
                sleep 1
                driver.find_element(name: 'password').send_keys "failOnPassword"
                sleep 1
                driver.find_element(css: 'form button[type=submit]').click 
                sleep 1
        end   

end
