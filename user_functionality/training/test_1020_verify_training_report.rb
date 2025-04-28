# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/navigate_around_app_employee_extension'
require './functions_library/navigate_around_app_lm_extension'
require './functions_library/employee_dashboard_extension'
require './functions_library/employee_profile_extension'
require './functions_library/manager_dashboard_extension'
require './functions_library/people_page_extension'
require './functions_library/training_extension'
require './functions_library/reports_extension'

RSpec.describe 'Employee Requests Training and is Approved' do # rubocop:disable Metrics/BlockLength
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

  it '1A - Open Training Request Form' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_employee
    LoginAppExtension.new(@driver).select_hr
    sleep 1
    EmployeeDashboardExtension.new(@driver).expand_dashboard_container
    sleep 1
    EmployeeDashboardExtension.new(@driver).click_widget('Request training')
    sleep 0.5
    TrainingExtension.new(@driver).fill_out_training_form
    expect(TrainingExtension.new(@driver).training_title).to eql('Employee Requested Training')
  end

  it '2A - HR Opens Reports' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_hr
    LoginAppExtension.new(@driver).select_hr
    sleep 0.5
    AppNavigationExtensionManager.new(@driver).open_reports
    expect(@driver.title).to eql('Reports')
  end

  it '2B - HR Opens Training Report' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_hr
    LoginAppExtension.new(@driver).select_hr
    sleep 0.5
    AppNavigationExtensionManager.new(@driver).open_reports
    sleep 0.25
    ReportsExtension.new(@driver).click_on_report('Training')
    expect(@driver.title).to eql('Training')
  end

  it '2C - HR Verifies Record Appears in Training Report' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_hr
    LoginAppExtension.new(@driver).select_hr
    sleep 0.5
    AppNavigationExtensionManager.new(@driver).open_reports
    sleep 0.25
    ReportsExtension.new(@driver).click_on_report('Training')
    sleep 0.5
    expect(EmployeeProfileExtension.new(@driver).value_from_table('0', '10').text).to eql('Requested')
  end

  it '2D - Verify Training With Filters' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_hr
    LoginAppExtension.new(@driver).select_hr
    sleep 0.5
    AppNavigationExtensionManager.new(@driver).open_reports
    sleep 0.25
    ReportsExtension.new(@driver).click_on_report('Training')
    sleep 0.5
    ReportsExtension.new(@driver).filter_by_location('Working from Home')
    sleep 1
    expect(ReportsExtension.new(@driver).check_table_is_empty)
    ReportsExtension.new(@driver).clear_filters
    sleep 1
    ReportsExtension.new(@driver).filter_by_start_next_month
    sleep 0.5
    expect(EmployeeProfileExtension.new(@driver).value_from_table('0', '4').text).to eql('Employee Requested Training')
  end

  it '2E - Use Action Button To Open Training From Report' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_hr
    LoginAppExtension.new(@driver).select_hr
    sleep 0.5
    AppNavigationExtensionManager.new(@driver).open_reports
    sleep 0.25
    ReportsExtension.new(@driver).click_on_report('Training')
    sleep 0.5
    ReportsExtension.new(@driver).click_action_for_selected_row('1')
    expect(@driver.title).to eql('Training for Employee User')
  end

  it '3A - Manager Approves Training' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_hr
    LoginAppExtension.new(@driver).select_hr
    sleep 0.5
    AppNavigationExtensionManager.new(@driver).open_reports
    sleep 0.25
    ReportsExtension.new(@driver).click_on_report('Training')
    sleep 0.5
    ReportsExtension.new(@driver).click_action_for_selected_row('1')
    sleep 0.25
    TrainingExtension.new(@driver).manager_approves_training_request
    sleep 0.5
    expect(EmployeeProfileExtension.new(@driver).find_value_in_show_page('4')).to eql('Status Approved')
  end

  it '3B - Check Approved Status in Report' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_hr
    LoginAppExtension.new(@driver).select_hr
    sleep 0.5
    AppNavigationExtensionManager.new(@driver).open_reports
    sleep 0.25
    ReportsExtension.new(@driver).click_on_report('Training')
    sleep 0.5
    expect(EmployeeProfileExtension.new(@driver).value_from_table('0', '10').text).to eql('Approved')
  end

  it '4A - LM Deletes the Training' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_lm
    LoginAppExtension.new(@driver).select_hr
    AppNavigationExtensionLM.new(@driver).my_people
    sleep 0.5
    PeoplePageExtension.new(@driver).select_employee_from_lm_list('Employee User')
    sleep 0.5
    EmployeeProfileExtension.new(@driver).open_employee_training
    sleep 0.5
    TrainingExtension.new(@driver).delete_training_request
    sleep 0.25
    expect(EmployeeProfileExtension.new(@driver).check_for_empty_table).to be(true)
  end

  it '5A - HR Verifies Training Report is Empty' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_hr
    LoginAppExtension.new(@driver).select_hr
    sleep 0.5
    AppNavigationExtensionManager.new(@driver).open_reports
    sleep 0.25
    ReportsExtension.new(@driver).click_on_report('Training')
    sleep 0.5
    expect(ReportsExtension.new(@driver).check_table_is_empty)
  end
end
