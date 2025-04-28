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
require './functions_library/calendar_extension'
require './functions_library/training_extension'

RSpec.describe 'Employee Requests Training and Calendar is checked' do # rubocop:disable Metrics/BlockLength
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

  it '2A - Employee Opens Calendar' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_employee
    LoginAppExtension.new(@driver).select_hr
    sleep 1
    NavigateAroundAppEmployee.new(@driver).navigate_to_calendar_employee
    expect(@driver.title).to eql('Calendar')
  end

  it '2B - Employee Views Training in Calendar' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_lm
    LoginAppExtension.new(@driver).select_hr
    AppNavigationExtensionLM.new(@driver).my_people
    sleep 0.5
    PeoplePageExtension.new(@driver).select_employee_from_lm_list('Employee User')
    sleep 0.5
    EmployeeProfileExtension.new(@driver).open_employee_training
    TrainingExtension.new(@driver).click_on_training
    training_id = TrainingExtension.new(@driver).training_id_employee
    sleep 1
    NavigateAroundAppEmployee.new(@driver).navigate_to_calendar_employee
    sleep 0.5
    expect(CalendarExtension.new(@driver).find_training_request(training_id))
    CalendarExtension.new(@driver).filter_only_training
    expect(CalendarExtension.new(@driver).find_training_request(training_id))
  end

  it '3A - LM Opens Training Request and Rejects Training' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_lm
    LoginAppExtension.new(@driver).select_hr
    sleep 0.5
    ManagerDashboardExtension.new(@driver).switch_todos_to_training
    ManagerDashboardExtension.new(@driver).view_open_training_request
    sleep 0.5
    expect(TrainingExtension.new(@driver).status_from_request_form).to eql('Status Requested')
    TrainingExtension.new(@driver).manager_rejects_training_request
    sleep 1
    TrainingExtension.new(@driver).fill_out_rejection_form
    sleep 1
    expect(TrainingExtension.new(@driver).status_from_request_form).to eql('Status Rejected')
  end

  it '3B - LM Verifies that Training is no longer on Calendar' do
    NavigateBrowserExtension.new(@driver).breathe_login
    LoginExtension.new(@driver).login_functionality_lm
    LoginAppExtension.new(@driver).select_hr
    sleep 0.5
    AppNavigationExtensionLM.new(@driver).my_people
    sleep 0.5
    PeoplePageExtension.new(@driver).select_employee_from_lm_list('Employee User')
    sleep 0.5
    EmployeeProfileExtension.new(@driver).open_employee_training
    TrainingExtension.new(@driver).click_on_training
    training_id = TrainingExtension.new(@driver).training_id_employee
    NavigateAroundAppEmployee.new(@driver).navigate_to_calendar_employee
    sleep 0.5
    expect(
      CalendarExtension.new(@driver).verify_training_not_present("EmployeeTrainingCourse_#{training_id}")
    ).to be(true)
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
