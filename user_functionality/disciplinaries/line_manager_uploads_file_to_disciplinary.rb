# rubocop:disable Style/FrozenStringLiteralComment
require 'rspec'
require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/people_page_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/navigate_around_app_lm_extension'
require './functions_library/navigate_around_app_employee_extension'
require './functions_library/settings_config/disciplinary/disciplinary_extension'

RSpec.describe 'Uploads a File to Disciplinary' do # rubocop:disable Metrics/BlockLength
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

  it '3A - Open Upload Documents Form' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 0.5
    DisciplinaryExtension.new(@driver).go_to_disciplinary_from_table('0')
    DisciplinaryExtension.new(@driver).switch_to_documents_tab
    DisciplinaryExtension.new(@driver).open_document_upload_form
    expect(@driver.title).to eql('Add document for Employee User')
  end

  it '3B - Upload Document and Submit Form' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 0.5
    DisciplinaryExtension.new(@driver).go_to_disciplinary_from_table('0')
    TestFunctions.new(@driver).upload_document
    sleep 1
    documents_nav_link = DisciplinaryExtension.new(@driver).title_of_documents_nav_link
    expect(documents_nav_link.text).to eql('Attached documents 1')
  end

  it '3C - Verify Document Upload From Documents Table' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 0.5
    DisciplinaryExtension.new(@driver).go_to_disciplinary_from_table('0')
    sleep 0.5
    DisciplinaryExtension.new(@driver).switch_to_documents_tab
    sleep 2
    file_title = DisciplinaryExtension.new(@driver).value_from_table('0', '0')
    expect(file_title.text).to eql('Regression File')
  end

  it '3D - Verify Document Upload From Disciplinary Table' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 0.5
    num_of_docs = DisciplinaryExtension.new(@driver).value_from_table('0', '5')
    expect(num_of_docs.text).to eql('1')
  end

  it '4A - Employee Attempts to View Document' do
    TestFunctions.new(@driver).login_as_emp
    NavigateAroundAppEmployee.new(@driver).navigate_to_profile_employee
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 0.5
    DisciplinaryExtension.new(@driver).go_to_disciplinary_from_table('0')
    sleep 0.5
    expect(DisciplinaryExtension.new(@driver).verify_emp_cant_view_docs).to be(true)
  end

  it '4B - Employee Attempts to Upload Document From URL' do
    TestFunctions.new(@driver).login_as_emp
    DisciplinaryExtension.new(@driver).attempt_to_open_document_upload_url('25471', '211')
    sleep 0.5
    expect(@driver.title).to eql('Permission Denied (403)')
  end

  it '5A - Edit Uploaded Document' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 0.5
    DisciplinaryExtension.new(@driver).go_to_disciplinary_from_table('0')
    sleep 1
    DisciplinaryExtension.new(@driver).switch_to_documents_tab
    DisciplinaryExtension.new(@driver).open_edit_document_form
    DisciplinaryExtension.new(@driver).complete_edit_document_form
    sleep 1
    doc_name = DisciplinaryExtension.new(@driver).value_from_table('0', '0')
    expect(doc_name.text).to eql('Updated Document')
  end

  it '6A - Delete Document' do
    TestFunctions.new(@driver).login_and_select_hr
    sleep 1
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 0.5
    DisciplinaryExtension.new(@driver).go_to_disciplinary_from_table('0')
    sleep 1
    DisciplinaryExtension.new(@driver).switch_to_documents_tab
    sleep 0.5
    DisciplinaryExtension.new(@driver).delete_document
    sleep 1
    documents_nav_link = DisciplinaryExtension.new(@driver).title_of_documents_nav_link
    expect(documents_nav_link.text).to eql('Attached documents 0')
  end

  it '6B - Verify Document Delete From Disciplinary Table' do
    TestFunctions.new(@driver).login_and_select_hr
    sleep 1
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 0.5
    num_of_docs = DisciplinaryExtension.new(@driver).value_from_table('0', '5')
    expect(num_of_docs.text).to eql('0')
  end

  it '7A - Uploading a pdf' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 0.5
    DisciplinaryExtension.new(@driver).go_to_disciplinary_from_table('0')
    TestFunctions.new(@driver).upload_document_pdf
    sleep 1
    documents_nav_link = DisciplinaryExtension.new(@driver).title_of_documents_nav_link
    expect(documents_nav_link.text).to eql('Attached documents 1')
  end

  it '7B - LM Previews PDF in browser' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 0.5
    DisciplinaryExtension.new(@driver).go_to_disciplinary_from_table('0')
    sleep 0.5
    DisciplinaryExtension.new(@driver).switch_to_documents_tab
    sleep 0.5
    original_window = @driver.window_handle
    DisciplinaryExtension.new(@driver).view_pdf_document
    @driver.window_handles.each do |handle|
      if handle != original_window
        @driver.switch_to.window handle
        break
      end
    end
    expect(@driver.current_url).to include('preview')
  end

  it '7C - Employee Attempts to View PDF' do
    TestFunctions.new(@driver).login_and_select_hr
    TestFunctions.new(@driver).open_employee_from_list
    TestFunctions.new(@driver).open_disciplinary_from_profile
    sleep 0.5
    DisciplinaryExtension.new(@driver).go_to_disciplinary_from_table('0')
    sleep 0.5
    DisciplinaryExtension.new(@driver).switch_to_documents_tab
    sleep 0.5
    original_window = @driver.window_handle
    DisciplinaryExtension.new(@driver).view_pdf_document
    @driver.window_handles.each do |handle|
      if handle != original_window
        @driver.switch_to.window handle
        break
      end
    end
    pdf_url = @driver.current_url
    TestFunctions.new(@driver).login_as_emp
    @driver.navigate.to(pdf_url)

    expect(@driver.title).to eql('Permission Denied (403)')
  end

  it '8A - Delete Disciplinary' do
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

  def upload_document
    DisciplinaryExtension.new(@driver).switch_to_documents_tab
    DisciplinaryExtension.new(@driver).open_document_upload_form
    DisciplinaryExtension.new(@driver).complete_document_upload_form
  end

  def upload_document_pdf
    DisciplinaryExtension.new(@driver).switch_to_documents_tab
    DisciplinaryExtension.new(@driver).open_document_upload_form
    DisciplinaryExtension.new(@driver).complete_document_upload_form_pdf
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
