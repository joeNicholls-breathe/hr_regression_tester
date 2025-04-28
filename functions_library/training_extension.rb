# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class TrainingExtension < Base # rubocop:disable Metrics/ClassLength
  def give_training_request_name
    driver.find_element(id: 'employee_training_course_name').send_keys 'Employee Requested Training'
  end

  def select_company_training_type
    training_type = driver.find_element(id: 'employee_training_course_company_training_type_id')
    choose = Selenium::WebDriver::Support::Select.new(training_type)
    choose.select_by(:text, 'CPD')
  end

  def select_company_training_category
    training_type = driver.find_element(id: 'employee_training_course_company_training_category_id')
    choose = Selenium::WebDriver::Support::Select.new(training_type)
    choose.select_by(:text, 'General')
  end

  def click_training_breadcrumb
    driver.find_element(css: 'body > div.hr-main-container > div.hr-main > section > div.breadcrumb > a').click
  end

  def confirm_training_form
    driver.find_element(class: 'btn-success').click
  end

  def add_training_start_date
    driver.find_element(id: '#employee_training_course_start_on_react').send_keys todays_date_string
  end

  def add_training_start_date_next_week
    driver.find_element(id: '#employee_training_course_start_on_react').send_keys one_week_date_string
  end

  def add_training_end_date
    driver.find_element(id: '#employee_training_course_end_on_react').send_keys one_week_date_string
  end

  def add_training_expires_on_date
    driver.find_element(id: '#employee_training_course_expires_on_react').send_keys one_month_date_string
  end

  def add_training_cost
    driver.find_element(id: 'employee_training_course_cost').send_keys '100'
  end

  def add_training_structured_units
    driver.find_element(id: 'employee_training_course_structured_units').send_keys '2'
  end

  def add_training_unstructured_units
    driver.find_element(id: 'employee_training_course_unstructured_units').send_keys '3'
  end

  def add_training_hours
    driver.find_element(id: 'employee_training_course_hours').send_keys '5'
  end

  def manager_rejects_training_request
    driver.find_element(
      css: 'body > div.hr-main-container > div > section > div.row > div.col-12 > div > div.form-group.buttons > a.btn.btn-secondary' # rubocop:disable Layout/LineLength
    ).click
  end

  def manager_approves_training_request
    driver.find_element(
      css: 'body > div.hr-main-container > div > section > div.row > div.col-12 > div > div.form-group.buttons > a.btn.btn-success' # rubocop:disable Layout/LineLength
    ).click
  end

  def fill_out_rejection_form
    driver.find_element(id: 'employee_training_course_rejection_reason').send_keys 'REJECT TEST'
    driver.find_element(id: 'save_rejection_message').click
  end

  def compare_training_request_status(expected_status)
    status = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td:nth-child(3)').text
    if status == expected_status
      puts "PASS - Status is #{expected_status}"
    else
      puts "FAIL - Status is #{status} should be #{expected_status}"
    end
  end

  def delete_training_request
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > svg').click
    driver.find_element(class: 'modal-confirm').click
  end

  def training_id_manager
    current_url = driver.current_url
    split_url = current_url.split('training_courses/')
    split_url[1]
  end

  def training_id_employee
    current_url = driver.current_url
    split_url = current_url.split('training_courses/', 0)
    split_url[1]
  end

  def open_edit_modal
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(1) > svg').click
  end

  def set_outcome_to_passed
    outcome = driver.find_element(id: 'employee_training_course_outcome')
    choose = Selenium::WebDriver::Support::Select.new(outcome)
    choose.select_by(:text, 'Passed')
  end

  def training_outcome
    row = driver.find_element(css: '#DataTables_Table_0 > tbody')
    columns = row.find_elements(tag_name: 'TD')
    outcome = columns.select { |x| x.attribute('cellIndex') == '7' }
    outcome[0].text
  end

  def fill_out_training_form # rubocop:disable Metrics/AbcSize
    TrainingExtension.new(driver).give_training_request_name
    TrainingExtension.new(driver).select_company_training_type
    TrainingExtension.new(driver).select_company_training_category
    TrainingExtension.new(driver).add_training_start_date
    TrainingExtension.new(driver).add_training_end_date
    TrainingExtension.new(driver).add_training_cost
    TrainingExtension.new(driver).add_training_expires_on_date
    TrainingExtension.new(driver).add_training_structured_units
    TrainingExtension.new(driver).add_training_unstructured_units
    TrainingExtension.new(driver).confirm_training_form
  end

  def fill_out_training_form_next_week # rubocop:disable Metrics/AbcSize
    TrainingExtension.new(driver).give_training_request_name
    TrainingExtension.new(driver).select_company_training_type
    TrainingExtension.new(driver).select_company_training_category
    TrainingExtension.new(driver).add_training_start_date_next_week
    TrainingExtension.new(driver).add_training_end_date
    TrainingExtension.new(driver).add_training_cost
    TrainingExtension.new(driver).add_training_expires_on_date
    TrainingExtension.new(driver).add_training_structured_units
    TrainingExtension.new(driver).add_training_unstructured_units
    TrainingExtension.new(driver).confirm_training_form
  end

  def training_title
    driver.find_element(
      css: 'body > div.hr-main-container > div.hr-main > section > div.employee-section-header > h1'
    ).text
  end

  def status_from_request_form
    table = driver.find_element(class: 'table')
    rows = table.find_elements(tag_name: 'TR')
    rows.find { |x| x.attribute('sectionRowIndex') == '4' }.text
  end

  def click_on_training
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(2) > svg').click
  end
end
