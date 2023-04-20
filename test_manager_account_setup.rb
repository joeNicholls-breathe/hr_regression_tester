require 'selenium-webdriver'
require './functions_library/navigate_browser_extension.rb'
require './functions_library/navigate_around_app_manager.rb'
require './functions_library/test_page_check.rb'
require './functions_library/test_reference_extension.rb'

class AccountSetup
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_account_setup
    login
    navigate to configuration settings
    enter company details
    switch on modules - chargable
    switch on modules - free
    add a custom field
    switch on payroll exports
    switch on change logs
    add onboarding tasks for employee
    switch on xero integration *might want to do this as the buy now journey*
    navigate to picklists
    details
    absence
    training
    company organisation
    pay and benefits
    recruitment
    performance management
    email notification set up
    permissions and approvals of HR/Line Managers and employees
    abscence settings - holidays and working patterns (adding new and editing away from the default)
    check what people can do - employee
    check what people can do - Line manager
    check what people can do - HR user
    security 2fa

    add line manager to account
    add employee to account

    assign permissions to employees 
    assign line managers to employees
  


    driver.close
  end
end

AccountSetup.new.test_account_setup