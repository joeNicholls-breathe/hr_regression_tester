# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/marketplace_extension'

RSpec.describe 'Verify MarketPlace Functionality' do # rubocop:disable Metrics/BlockLength
  before do
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for :chrome, options:
  end

  after do
    @driver.quit
  end
  #  Left value is the title of the page at /marketplace/product
  #  Right value is the end of the href on the 'Find out more button'
  endpoint = {
    'ELMO Learning' => 'elmolearning',
    'ELMO Survey' => 'elmosurvey',
    'Harriet' => 'harriet',
    'hireful' => 'hireful',
    'iThink Connect Sync' => 'ithinkconnectsync',
    'LivePay' => 'livepay',
    'Mintago' => 'mintago',
    'Pleo' => 'pleo',
    'RotaCloud' => 'rotacloud',
    'Xero' => 'xero'
  }

  endpoint.each do |name, href|
    it "#{name} Opened" do
      NavigateBrowserExtension.new(@driver).breathe_login
      LoginExtension.new(@driver).login_functionality_admin
      LoginAppExtension.new(@driver).select_hr
      MarketPlaceExtension.new(@driver).navigate_to_marketplace
      MarketPlaceExtension.new(@driver).open_marketplace_widget(href)
      sleep 0.5
      expect(MarketPlaceExtension.new(@driver).page_title(name))
    end
  end
end
