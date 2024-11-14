# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require 'rspec'
require './functions_library/ui_page_element_check'
require './functions_library/test_reference_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_browser_extension'
require './settings'

RSpec.describe 'Rota Regression test script' do
  before do
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for :chrome, options: options
  end

  it 'navigate to breathe user login' do
    NavigateBrowserExtension.new(@driver).breathe_login
    expect(@driver.title).to eql('Log in to Breathe')
  end

  it 'login as rota admin user via RTA widget' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    expect(@driver.title).to eql('Rota, Time & Attendance')
  end

  it 'assign and share shift to an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaExtension.new(@driver).assign_shift
    sleep 1
    RotaExtension.new(@driver).share_shift
    sleep 1
    expect(@driver.title).to eql('')
  end

  it 'create a template for an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaExtension.new(@driver).create_template
    expect(@driver.title).to eql('')
  end

  it 'delete a template for an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    sleep 0.25
    RotaExtension.new(@driver).delete_template
    expect(@driver.title).to eql('')
  end

  it 'assign a template for an employee' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_rota_admin
    LoginAppExtension.new(@driver).select_rota
    expect(@driver.title).to eql('')
  end
end
