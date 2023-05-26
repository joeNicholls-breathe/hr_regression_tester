require 'selenium-webdriver'
require File.expand_path('../functions_library/base.rb', __FILE__)
require './functions_library/navigate_browser_extension.rb'
require './functions_library/login_extension.rb'
require './functions_library/login_app_extension.rb'




class TestOne < Base
  def test_bulk_create
    TestLoginHr.login_in
    puts "Login - Pass"
    BulkImportExtension.navigate_to_bulk_upload
    sleep 5
    driver.close
  end
end

TestOne.new.test_bulk_create
