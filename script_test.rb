
Selenium::WebDriver.logger.level = :debug
Selenium::WebDriver.logger.output = 'selenium.log'

driver.manage.timeouts.implicit_wait = 3 # seconds




2.1.5 :010 > element = browser.find_element(:id, 'test_read')
 => #<Selenium::WebDriver::Element:0xe9ef59dfcb30f58 id="{07900097-19fb-9b4f-bc1f-a693bbde14b7}">
2.1.5 :011 > element.text 
=> "Contents of test_read element"


namespace : do
    desc ""
    task : :environment do
        
    end
end
