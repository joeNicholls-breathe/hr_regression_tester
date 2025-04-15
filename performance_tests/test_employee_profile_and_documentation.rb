require_relative 'base_performance_test'
require_relative '../functions_library/login_extension'
require_relative '../functions_library/employee_dashboard_extension'
require_relative '../functions_library/navigate_around_app_employee_extension'
require_relative '../functions_library/ui_page_element_check_extension'

RSpec.describe 'Employee Profile and Documentation Tests' do
  before(:each) do
    @performance_test = BasePerformanceTest.new(@driver)
    @login_extension = LoginExtension.new(@driver)
    @employee_dashboard = EmployeeDashboardExtension.new(@driver)
    @navigation = NavigateAroundAppEmployeeExtension.new(@driver)
    @ui_check = UiPageElementCheckExtension.new(@driver)
  end

  it 'allows an employee to add all profile fields and upload documentation' do
    execution_time = @performance_test.measure_execution_time do
      # Login as employee
      @login_extension.login('setup_acc_email_lm_employee', 'Password1')

      # Navigate to profile section
      @navigation.go_to_profile

      # Fill in all profile fields, including personal and job fields
      @employee_dashboard.fill_in_profile_fields({
        first_name: 'John',
        last_name: 'Doe',
        address: '123 Main Street',
        phone: '1234567890',
        emergency_contact: 'Jane Doe',
        emergency_contact_phone: '0987654321',
        date_of_birth: '1990-01-01',
        marital_status: 'Single',
        job_title: 'Software Engineer',
        department: 'Engineering',
        start_date: '2020-01-15',
        manager: 'Jane Smith'
      })

      # Upload documentation for each record
      @employee_dashboard.upload_documentation('Profile Picture', '/path/to/profile_picture.jpg')
      @employee_dashboard.upload_documentation('Resume', '/path/to/resume.pdf')
      @employee_dashboard.upload_documentation('ID Proof', '/path/to/id_proof.pdf')

      # Verify all records and documents are visible
      expect(@ui_check.record_visible?('Profile Picture')).to be true
      expect(@ui_check.record_visible?('Resume')).to be true
      expect(@ui_check.record_visible?('ID Proof')).to be true

      # Logout
      @login_extension.logout
    end

    # Ensure execution time is within acceptable limits
    expect(execution_time).to be < 10 # Example threshold in seconds
  end
end