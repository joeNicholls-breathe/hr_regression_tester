require File.expand_path('../base.rb', __FILE__)
require './functions_library/test_reference_extension.rb'

class CreateEmployeeExtension < Base
  def create_employee_pending_starter_from_people_page
    driver.find_element(xpath: '/html/body/section[2]/div[1]/a').click ##add new employee on people page
    driver.find_element(id: 'employee_first_name').send_keys "Newemployee"
    driver.find_element(id: 'employee_last_name').send_keys "User"
    driver.find_element(id: 'employee_jobs_attributes_0_title').send_keys "Pending Starter Test"
    driver.find_element(id: '#employee_join_date_react').send_keys TestRefExtension.tomorrow
    ## may not be able to do this on a new account as id are new for the account although we could scan the url and find them
    #driver.find_element(id: 'employee_company_department_id').send_keys "" 
    #driver.find_element(id: 'employee_company_location_id').send_keys ""
    driver.find_element(id: 'employee_employee_ref').send_keys "1010"
    driver.find_element(id: 'employee_gets_statutory_true').click
    driver.find_element(id: 'employee_statutory_holiday_country_id').click
    driver.find_element(css: 'data-disable-with="add person"').click
  end
end
