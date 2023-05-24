require 'selenium-webdriver'
require './functions_library/navigate_browser_extension.rb'
require './functions_library/sign_up_extension.rb'
require './functions_library/bulk_imports_extension.rb'
require './functions_library/navigate_around_app_manager.rb'
require './functions_library/test_page_check.rb'
require './functions_library/test_reference_extension.rb'

class TestSignUp < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_sign_up
    NavigateBrowserExtension.new(driver).breathe_signup
    puts "Navigate to breathe sign up screen - Pass"
    NavigateBrowserExtension.new(driver).cookie_modal_accept
    puts "Accept cookie in pop up"
    SignUpExtension.new(driver).sign_up
    puts "Sign Up form - Pass"
    BulkImportExtension.new(driver).navigate_to_bulk_upload
    puts "Navigate to bulk upload form"
    #BulkImportExtension.new(driver).bulk_upload_employee_full
    #puts "Upload full import spreadsheet"
    AppNavigationExtensionManager.new(driver).navigate_to_dashboard
    puts "Return to Manager Dashboard"
    AppNavigationExtensionManager.new(driver).navigate_to_people_screen
    puts "Navigate to People screen via pill"
    CreateEmployeeExtension.new(driver).create_employee_pending_starter_from_people_page
    puts "Create new employee via people page, that will start tomorrow"
    AppNavigationExtensionManager.new(driver).navigate_to_employee_dashboard_as_manager
    puts "Return to Manager Dashboard"
    TestPageCheck.new(driver).check_pending_starters
    puts "Check pending starters on dashboard are present"

    sleep 10
    driver.close
  end
end

TestSignUp.new.test_sign_up
