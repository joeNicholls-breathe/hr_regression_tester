require 'selenium-webdriver'
require './functions_library/navigate_browser_extension.rb'
require './functions_library/sign_up_extension.rb'
require './functions_library/bulk_imports_extension.rb'
require './functions_library/navigate_around_app_manager.rb'
require './functions_library/test_page_check.rb'
require './functions_library/test_reference_extension.rb'

class TestSignUp
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    #driver.manage.timeout.implicit_wait = 3
    Selenium::WebDriver.logger.level = :info
  end

  def test_sign_up
    NavigateBrowserExtension.new(driver).breathe_signup
    puts "Navigate to breathe sign up screen - Pass"
    sleep 1
    NavigateBrowserExtension.new(driver).cookie_modal_accept
    puts "Accept cookie in pop up"
    sleep 1
    SignUpExtension.new(driver).sign_up
    puts "Sign Up form - Pass"
    sleep 2
    BulkImportExtension.new(driver).navigate_to_bulk_upload
    puts "Navigate to bulk upload form"
    sleep 2
    BulkImportExtension.bulk_upload_employee_full
    puts "Upload full import spreadsheet"
    sleep 2
    AppNavigationExtensionManager.navigate_to_employee_dashboard_as_manager
    puts "Return to Manager Dashboard"
    sleep 2
    AppNavigationExtensionManager.navigate_to_people_screen
    puts "Navigate to People screen via pill"
    sleep 2
    CreateEmployeeExtension.create_employee_pending_starter_from_people_page
    puts "Create new employee via people page, that will start tomorrow"
    sleep 2
    AppNavigationExtensionManager.navigate_to_employee_dashboard_as_manager
    puts "Return to Manager Dashboard"
    sleep 2
    TestPageCheck.check_pending_starters
    puts "Check pending starters on dashboard are present"
    sleep 2




    driver.close
  end
end

TestSignUp.new.test_sign_up
