require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension.rb'
require './functions_library/sign_up_extension.rb'
require './functions_library/bulk_imports_extension.rb'
require './functions_library/navigate_around_app_manager.rb'
require './functions_library/create_employee_extension.rb'
require './functions_library/ui_page_element_check.rb'
require './functions_library/test_reference_extension.rb'
require './functions_library/settings_config/account_config_navigation/account_configuration_navigation_extension.rb'
require './functions_library/settings_config/2FA/2fa_extension.rb'
require './functions_library/login_extension.rb'
require './functions_library/login_app_extension.rb'
require './functions_library/saas_extension.rb'

class TestSignUpNegative < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    #Selenium::WebDriver.logger.level = :info
  end

  def test_sign_up
     driver.close
  end
end

TestSignUpNegative.new.test_sign_up