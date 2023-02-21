require 'selenium-webdriver'
require 'Benchmark'

class NavigateBrowserExtension
    attr_accessor :driver
   def initialize(driver)
        @driver = driver
    end

    def breathe_login
        timer = Benchmark.measure do 
            driver.navigate.to('https://login.breathehrstaging.com/login')
            puts 'Test Navigate to URl'
        end
        puts timer.total*1000
        
        if timer.total > 3 
            puts 'URL load time over performance requirement'
        end  
    end

    def breathe_signup
        driver.navigate.to('https://hr.breathehrstaging.com/signup')
    end

    def cookie_modal_accept
        driver.find_element(id:'CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll').click
    end
    

    private 

    attr_reader :driver
end
