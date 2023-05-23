require File.expand_path('../base.rb', __FILE__)
require './functions_library/test_reference_extension.rb'

class SignUpExtension < Base
    def sign_up
        driver.find_element(id:'admin-first-name').send_keys "Admin"
        driver.find_element(id:'admin-last-name').send_keys "User"
        driver.find_element(id:'admin-email').send_keys "admin" + "1" + "@regressionaccount.com"
        #driver.find_element(id:'admin-email').send_keys settings[:staging][:sign_up_email]
        driver.find_element(id:'account-name').send_keys "RegressionAccount"
        drop = driver.find_element(id:'employee-count')
        choose = Selenium::WebDriver::Support::Select.new(drop)
        choose.select_by(:text, "11-20")
        driver.find_element(id:'contact-number').send_keys "01342 717123"
        driver.find_element(id:'admin-password').send_keys "Password1"
        driver.find_element(id:'admin-password-confirmation').send_keys "Password1"
        driver.find_element(css:'#account-terms-read-label > span').click
        sleep 0.5
        driver.find_element(id:'new-account-submit').click
    end
end
