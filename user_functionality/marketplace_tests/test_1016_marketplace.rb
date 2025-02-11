# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/marketplace_extension'

class MarketPlaceTests
  attr_accessor :driver

  # Tests the create, edit, delete functions for bradford factor triggers

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def execute # rubocop:disable Metrics/MethodLength
    open_marketplace
    open_elmo_learning
    open_elmo_survey
    open_harriet
    open_hireful
    open_ithink_connect_sync
    open_live_pay
    open_mintago
    open_pleo
    open_rota_cloud
    open_xero
  end

  def open_marketplace
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'PASS - load landing page'
    LoginExtension.new(driver).login_setup_acc_admin
    puts 'PASS - login as admin'
    LoginAppExtension.new(driver).select_hr
    MarketPlaceExtension.new(driver).navigate_to_marketplace
    puts 'PASS - MarketPlace Opened'
  end

  def open_elmo_learning
    MarketPlaceExtension.new(driver).open_marketplace_widget('elmolearning')
    MarketPlaceExtension.new(driver).check_page_title('ELMO Learning')
  end

  def open_elmo_survey
    MarketPlaceExtension.new(driver).open_marketplace_widget('elmosurvey')
    MarketPlaceExtension.new(driver).check_page_title('ELMO Survey')
  end

  def open_harriet
    MarketPlaceExtension.new(driver).open_marketplace_widget('harriet')
    MarketPlaceExtension.new(driver).check_page_title('Harriet')
  end

  def open_hireful
    MarketPlaceExtension.new(driver).open_marketplace_widget('hireful')
    MarketPlaceExtension.new(driver).check_page_title('hireful')
  end

  def open_ithink_connect_sync
    MarketPlaceExtension.new(driver).open_marketplace_widget('ithinkconnectsync')
    MarketPlaceExtension.new(driver).check_page_title('iThink Connect Sync')
  end

  def open_live_pay
    MarketPlaceExtension.new(driver).open_marketplace_widget('livepay')
    MarketPlaceExtension.new(driver).check_page_title('LivePay')
  end

  def open_mintago
    MarketPlaceExtension.new(driver).open_marketplace_widget('mintago')
    MarketPlaceExtension.new(driver).check_page_title('Mintago')
  end

  def open_pleo
    MarketPlaceExtension.new(driver).open_marketplace_widget('pleo')
    MarketPlaceExtension.new(driver).check_page_title('Pleo')
  end

  def open_rota_cloud
    MarketPlaceExtension.new(driver).open_marketplace_widget('rotacloud')
    MarketPlaceExtension.new(driver).check_page_title('RotaCloud')
  end

  def open_xero
    MarketPlaceExtension.new(driver).open_marketplace_widget('xero')
    MarketPlaceExtension.new(driver).check_page_title('Xero')
  end
end

MarketPlaceTests.new.execute
