require 'selenium-webdriver'

class SignUpExtension
    attr_accessor :driver
    def initialize(driver)
         @driver = driver
    end

    def sign_up
        driver.find_element(id:'admin-first-name').send_keys "Admin"
        driver.find_element(id:'admin-last-name').send_keys "User"
        driver.find_element(id:'admin-email').send_keys "admin01@regressionaccount.com"
        driver.find_element(id:'account-name').send_keys "RegressionAccount"
        
        #driver.find_element(id:'employee-count')
        #selectObject.select_by_value "20"
        #var selectObject = new select_element 

        driver.find_element(id:'contact-number').send_keys "01342 717123"
        driver.find_element(id:'admin-password').send_keys "Password1"
        driver.find_element(id:'admin-password-confirmation').send_keys "Password1"
        driver.find_element(css:'#account-terms-read-label > span').click
        sleep 1
        driver.find_element(id:'new-account-submit').click
    end

    private 

    attr_reader :driver
end