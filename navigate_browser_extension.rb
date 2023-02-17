require 'selenium-webdriver'
require 'Benchmark'

class NavigateBrowserExtension
    attr_accessor :driver
   def initialize(driver)
        @driver = driver
    end

    def breathe
        timer = Benchmark.measure do 
            driver.navigate.to('https://login.breathehrstaging.com/login')
            puts 'Test Navigate to URl'
        end
        puts timer.total*1000
        
        if timer.total > 3 
            puts 'URL load time over performance requirement'
        end  
    end

    private 

    attr_reader :driver
end
