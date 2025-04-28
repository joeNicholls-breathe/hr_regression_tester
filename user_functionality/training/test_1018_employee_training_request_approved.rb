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

  it '1A - Logs in and Opens Training Request Form' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_employee
    LoginAppExtension.new(@driver).select_hr
    sleep 1
    EmployeeDashboardExtension.new(@driver).expand_dashboard_container
    sleep 1
    EmployeeDashboardExtension.new(@driver).click_widget('Request training')
    sleep 0.5
    expect(@driver.title).to eql('Request training')
  end

  it '2A - Complete Training Request Form' do
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

  it '3A - LM Logs In and Views Request in Dashboard' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_lm
    LoginAppExtension.new(@driver).select_hr
    sleep 0.5
    ManagerDashboardExtension.new(@driver).switch_todos_to_training
    expect(ManagerDashboardExtension.new(@driver).description_of_open_training).to include(
      'Employee Requested Training'
    )
  end

  it '3B - LM Opens Training Request and Approves Training' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_lm
    LoginAppExtension.new(@driver).select_hr
    sleep 0.5
    ManagerDashboardExtension.new(@driver).switch_todos_to_training
    ManagerDashboardExtension.new(@driver).view_open_training_request
    sleep 0.5
    expect(TrainingExtension.new(@driver).status_from_request_form).to eql('Status Requested')
    TrainingExtension.new(@driver).manager_approves_training_request
    expect(TrainingExtension.new(@driver).status_from_request_form).to eql('Status Approved')
  end

  it '4A - Employee Checks Status of Training Request' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_employee
    LoginAppExtension.new(@driver).select_hr
    sleep 0.5
    NavigateAroundAppEmployee.new(@driver).navigate_to_profile_employee
    EmployeeProfileExtension.new(@driver).open_employee_training
    expect(EmployeeProfileExtension.new(@driver).value_from_table('0', '2').text).to eql('Approved')
  end

  it '5A - LM Edits Status of Training' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_lm
    LoginAppExtension.new(@driver).select_hr
    AppNavigationExtensionLM.new(@driver).my_people
    sleep 0.5
    PeoplePageExtension.new(@driver).select_employee_from_lm_list('Employee User')
    sleep 0.5
    EmployeeProfileExtension.new(@driver).open_employee_training
    sleep 0.5
    TrainingExtension.new(@driver).open_edit_modal
    sleep 0.25
    TrainingExtension.new(@driver).set_outcome_to_passed
    TrainingExtension.new(@driver).confirm_training_form
    expect(EmployeeProfileExtension.new(@driver).find_value_in_show_page('7')).to eql('Outcome Passed')
  end

  it '5B - LM Deletes the Training' do
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
end
