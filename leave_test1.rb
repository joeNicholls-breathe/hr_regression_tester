require 'selenium-webdriver'




# set the timeout to 2 seconds wait = Selenium::WebDriver::Wait.new(:timeout => 2)

driver = Selenium::WebDriver.for :chrome
driver.navigate.to "https://login.breathehrstaging.com/login"
# set the timeout for implicit waits as 3 seconds
driver.manage.timeouts.implicit_wait = 2
driver.find_element(:id, 'email-input').send_keys "admin@regressionstaginguk.com"
driver.find_element(name: 'password')&.send_keys "Password1"
#sleep 5
driver.find_element(:css, 'form button[type="submit"]').click


driver.find_element(:class, 'hr').click

