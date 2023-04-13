require 'selenium-webdriver'
require './functions_library/navigate_browser_extension.rb'
require './functions_library/sign_up_extension.rb'
require './functions_library/bulk_imports_extension.rb'
require './functions_library/navigate_around_app_manager.rb'
require './functions_library/test_page_check.rb'

class TestSignUp
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def test_sign_up
    NavigateBrowserExtension.new(driver).breathe_signup
    puts "Navigate to breathe sign up screen - Pass"
    NavigateBrowserExtension.new(driver).cookie_modal_accept
    SignUpExtension.new(driver).sign_up
    puts "Sign Up form - Pass"
    sleep 2
    BulkImportExtension.navigate_to_bulk_upload
    puts "Navigate to bulk upload form"
    sleep 2
    BulkImportExtension.bulk_upload_employee_full
    puts "Upload full import spreadsheet"
    sleep 2
    AppNavigationExtensionManager.navigate_to_employee_dashboard_as_manager
    puts "Return to Manager Dashboard"
    TestPageCheck.check_pending_starters
    puts "Check pending starters on dashboard"
    sleep 2




    driver.close
  end
end

TestSignUp.new.test_sign_up
