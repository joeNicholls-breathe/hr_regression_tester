# rubocop:disable Style/FrozenStringLiteralComment
require 'rspec'
require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/people_page_extension'
require './functions_library/test_reference_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/navigate_around_app_lm_extension'
require './functions_library/navigate_around_app_employee_extension'
require './functions_library/settings_config/disciplinary/disciplinary_extension'

RSpec.describe 'Uploads Notes to Disciplinary' do # rubocop:disable Metrics/BlockLength
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

  it '1A - LM login and select HR' do
    TestFunctions.new(@driver).login_and_select_hr
    expect(@driver.title).to eql('My dashboard')
  end

  it '1B - Open My People' do
    TestFunctions.new(@driver).login_and_select_hr
    sleep 1
    AppNavigationExtensionLM.new(@driver).my_people
    sleep 1
    expect(@driver.title).to eql('My people')
  end

  it '1C - Select Employee User' do
    TestFunctions.new(@driver).login_and_select_hr
    sleep 1
    TestFunctions.new(@driver).open_employee_from_list
    expect(@driver.title).to eql('Profile for Employee User')
  end

  it '1E - Open Employee Disciplinary Profile' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 1
    expect(@driver.title).to eql('Disciplinaries for Employee User')
  end

  it '2A - Open Disciplinary Form' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 1
    DisciplinaryExtension.new(@driver).open_disciplinary_form
    expect(@driver.title).to eql('Add disciplinary for Employee User')
  end

  it '2B - Complete Disciplinary Form' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 1
    DisciplinaryExtension.new(@driver).open_disciplinary_form
    sleep 1
    DisciplinaryExtension.new(@driver).open_disciplinary_for_tomorrow
    sleep 1
    expect(@driver.title).to eql('Disciplinary for Employee User')
  end

  it '3C - Add Notes to Disciplinary' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 1
    DisciplinaryExtension.new(@driver).go_to_disciplinary_from_table('0')
    sleep 1
    DisciplinaryExtension.new(@driver).open_notes_upload_form
    sleep 0.5
    DisciplinaryExtension.new(@driver).complete_notes_form('Regression Note')
    expect(DisciplinaryExtension.new(@driver).title_of_notes_nav_link.text).to eql('Notes 1')
  end

  it '3D - Verify Note Added to Notes Table' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 0.5
    DisciplinaryExtension.new(@driver).go_to_disciplinary_from_table('0')
    sleep 0.5
    expect(NavigateAroundAppEmployee.new(@driver).value_from_table('0', '2').text).to eql('Regression Note')
  end

  it '3E - Verify Note Added From Disciplinary Table' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    expect(DisciplinaryExtension.new(@driver).check_last_note).to be(true)
  end

  it '4A - Check Notes Cant Be Viewed By Employee' do
    TestFunctions.new(@driver).login_as_emp
    NavigateAroundAppEmployee.new(@driver).navigate_to_profile_employee
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 1
    DisciplinaryExtension.new(@driver).go_to_disciplinary_from_table('0')
    sleep 1
    DisciplinaryExtension.new(@driver).verify_emp_cant_view_notes
  end

  it '4B - Employee Attempts to Upload Note From URL' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 0.5
    DisciplinaryExtension.new(@driver).go_to_disciplinary_from_table('0')
    DisciplinaryExtension.new(@driver).open_notes_upload_form
    url = @driver.current_url
    TestFunctions.new(@driver).login_as_emp
    @driver.navigate.to(url)
    expect(@driver.title).to eql('Permission Denied (403)')
  end

  it '5A - Update Note' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 0.5
    DisciplinaryExtension.new(@driver).go_to_disciplinary_from_table('0')
    DisciplinaryExtension.new(@driver).open_edit_document_form
    sleep 1
    DisciplinaryExtension.new(@driver).complete_notes_form('Updated Regression Note')
    expect(NavigateAroundAppEmployee.new(@driver).value_from_table('0', '2').text).to eql('Updated Regression Note')
  end

  it '6A - Delete Note' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 0.5
    DisciplinaryExtension.new(@driver).go_to_disciplinary_from_table('0')
    sleep 0.5
    DisciplinaryExtension.new(@driver).delete_note
    sleep 1
    expect(DisciplinaryExtension.new(@driver).title_of_notes_nav_link.text).to eql('Notes 0')
  end

  it '7C - Delete Disciplinary' do
    TestFunctions.new(@driver).login_and_select_hr
    sleep 1
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    DisciplinaryExtension.new(@driver).delete_disciplinary
    sleep 1
    expect(DisciplinaryExtension.new(@driver).check_for_empty_disciplinary_table).to be(true)
  end
end

class TestFunctions < Base
  def login_and_select_hr
    NavigateBrowserExtension.new(@driver).breathe_login
    sleep 1
    LoginExtension.new(@driver).login_functionality_lm
    sleep 1
    LoginAppExtension.new(@driver).select_hr
    sleep 1
  end

  def open_employee_from_list
    AppNavigationExtensionLM.new(@driver).my_people
    sleep 1
    PeoplePageExtension.new(@driver).select_employee_from_lm_list('Employee User')
  end

  def open_disciplinary_from_profile
    NavigateAroundAppEmployee.new(@driver).click_on_more_dropdown
    sleep 0.5
    AppNavigationExtensionManager.new(@driver).employee_profile_disciplinary_tab
  end

  def login_as_emp
    NavigateBrowserExtension.new(@driver).breathe_login
    sleep 1
    LoginExtension.new(@driver).login_functionality_employee
    sleep 1
    LoginAppExtension.new(@driver).select_hr
    sleep 1
  end
end
# rubocop:enable Style/FrozenStringLiteralComment
