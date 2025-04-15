# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/people_page_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/navigate_around_app_lm_extension'
require './functions_library/navigate_around_app_employee_extension'

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
class TestLMOpeningDisciplinaries
  attr_accessor :driver

  # Line manager open disciplinary on employee profile

  def initialize
    options = Selenium::WebDriver::Chrome::Options.new
    # options.add_argument('--headless')
    options.add_argument('--disable-gpu')
    options.add_argument('--window-size=1920,1080')
    @driver = Selenium::WebDriver.for(:chrome, options:)
    Selenium::WebDriver.logger.level = :info
  end

  def execute
    test_01_lm_opens_employee_disciplinaries
    test_02_lm_creates_disciplinary
    test_03_lm_edits_disciplinary
    test_04_employee_views_disciplinary
  end

  def test_01_lm_opens_employee_disciplinaries
    puts 'Test_01 Started'
    puts 'Start test - Employee creates open leave request'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_functionality_lm
    puts 'Pass - Login as employee'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Pass - Selects HR'
    sleep 1
    AppNavigationExtensionLM.new(driver).my_people
    puts 'Pass - Open My People'
    sleep 2
    PeoplePageExtension.new(driver).select_employee_from_lm_list('Employee User')
    puts 'Pass  - Employee Selected'
    sleep 1
    NavigateAroundAppEmployee.new(driver).click_on_more_dropdown
    sleep 1
    AppNavigationExtensionManager.new(driver).employee_profile_disciplinary_tab
    puts 'Test_01 Ended'
  end

  def test_02_lm_creates_disciplinary
    puts 'Test_02 Started'
    driver.find_element(class: 'fa-stack').click
    puts 'Pass - Disciplinary Form Opened'
    driver.find_element(id: '#grievance_date_of_incident_react').send_keys '11/04/2025'
    puts 'Pass - Date Entered'
    driver.find_element(id: 'grievance_desc').send_keys 'Regression Testing'
    puts 'Pass - Description Entered'
    driver.find_element(name: 'commit').click
    puts 'Pass - Form Submitted'
    puts 'Test_02 Ended'
  end

  def test_03_lm_edits_disciplinary
    driver.find_element(
      css: 'body > div.hr-main-container > div.hr-main > section > div.employee-section-header > div > a:nth-child(1) > span > svg.svg-inline--fa.fa-pencil-alt.fa-w-16.fa-inverse.fa-stack-1x'
    ).click
    appeal = driver.find_element(name: 'grievance[appeal_status]')
    select = Selenium::WebDriver::Support::Select.new(appeal)
    select.select_by(:value, 'in appeal')
    outcome = driver.find_element(name: 'grievance[company_disciplinary_outcome_id]')
    select = Selenium::WebDriver::Support::Select.new(outcome)
    select.select_by(:text, 'Dismissal')
    driver.find_element(name: '#grievance_expiry_date_react').send_keys '11/04/2025'
    driver.find_element(name: 'commit').click
  end

  def test_04_employee_views_disciplinary
    puts 'Start test - Employee views disciplinary'
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Pass - Navigate to Login Screen'
    sleep 1
    LoginExtension.new(driver).login_functionality_employee
    puts 'Pass - Login as employee'
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts 'Pass - Selects HR'
    sleep 1
    driver.find_element(id: 'top-menu-menu-item-0-2').click
    sleep 1
    NavigateAroundAppEmployee.new(driver).click_on_more_dropdown
    sleep 1
    AppNavigationExtensionManager.new(driver).employee_profile_disciplinary_tab
    first_row = driver.find_element(class: 'odd')
    columns = first_row.find_elements(tag_name: 'TD')
    status = columns.find { |x| x.attribute('cellIndex') == '5' }
    if status.text == 'open'
      puts 'PASS - Status is open'
    else
      puts 'Fail'
    end
    binding.pry
  end
end

TestLMOpeningDisciplinaries.new.execute
