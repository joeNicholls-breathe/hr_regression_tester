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

RSpec.describe 'LM Creating Disciplinary For Employee' do # rubocop:disable Metrics/BlockLength
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

  it '2C - Confirm Disciplinary Creation in Table' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 1
    expect(NavigateAroundAppEmployee.new(@driver).value_from_table('0', '2').text).to eql('Regression Testing')
  end

  it '3A - Edit Disciplinary' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 1
    DisciplinaryExtension.new(@driver).edit_disciplinary_from_table('0')
    sleep 0.5
    DisciplinaryExtension.new(@driver).complete_disciplinary_edit_form
    sleep 1
    expect(DisciplinaryExtension.new(@driver).find_value_in_details_and_status('3')).to eql(
      'Description Edited Regression Testing'
    )
  end

  it '3B - Confirm Edit in Disciplinary Table' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 1
    expect(NavigateAroundAppEmployee.new(@driver).value_from_table('0', '2').text).to eql('Edited Regression Testing')
  end

  it '3C - Confirm Resolution in Disciplinary Table' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    resolved_on = NavigateAroundAppEmployee.new(@driver).value_from_table('0', '6').text
    expect(resolved_on).to include(DisciplinaryExtension.new(@driver).resolved_today)
  end

  it '4A - Employee attempts to edit disciplinary' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 1
    DisciplinaryExtension.new(@driver).edit_disciplinary_from_table('0')
    url = @driver.current_url
    TestFunctions.new(@driver).login_as_emp
    @driver.navigate.to(url)
    expect(@driver.title).to eql('Permission Denied (403)')
  end

  it '5A - Delete Disciplinary' do
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
