require 'selenium-webdriver'
require 'pry'

class SignUpExtension
    attr_accessor :driver
    def initialize(driver)
         @driver = driver
    end


    def sign_up 
        driver.find_element(id:'admin-first-name').send_keys "Admin"
        driver.find_element(id:'admin-last-name').send_keys "User"
        binding.pry
        driver.find_element(id:'admin-email').send_keys "admin03@regressionaccount.com"
        driver.find_element(id:'account-name').send_keys "RegressionAccount"
        drop = driver.find_element(id:'employee-count')
        choose = Selenium::WebDriver::Support::Select.new(drop)
        choose.select_by(:text, "11-20")
        driver.find_element(id:'contact-number').send_keys "01342 717123"
        driver.find_element(id:'admin-password').send_keys "Password1"
        driver.find_element(id:'admin-password-confirmation').send_keys "Password1"
        driver.find_element(css:'#account-terms-read-label > span').click
        sleep 1
        driver.find_element(id:'new-account-submit').click
        sleep 5
    end

    private 

    attr_reader :driver
end