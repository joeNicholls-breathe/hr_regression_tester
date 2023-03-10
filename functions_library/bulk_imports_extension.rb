require File.expand_path('../base.rb', __FILE__)

class BulkImportExtension < Base
  def navigate_to_bulk_upload
    binding.pry
    driver.find_element(css:'#navbar-nav-dropdown > ul > li:nth-child(3)').click
    driver.find_element(css:'#navbar-nav-dropdown a:nth-child(4)').click
    driver.find_element(css:'body > section.content.container > div:nth-child(4) > div:nth-child(1) > div:nth-child(1) > a').click
    driver.find_element(css:'body > section.content.container > div.float-right > a').click
  end

  def add_new_import 
    driver.find_element(css:'body > section.content.container > div.float-right > a').click
  end

  def bulk_upload_employee_full
    driver.find_element(id:'employees_data_import_type').click
    drop = driver.find_element(id:'employees_data_import_type')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Import new people')
    driver.find_element(id:'employees_data_import_import').send_keys "/Users/henrycole/Desktop/automation/account_employee_setup/positive_imports/employee_full.xlsx"
    driver.find_element(id:'submit-import').click
  end
    
  def bulk_upload_employee_basic
    driver.find_element(id:'employees_data_import_type').click
    drop = driver.find_element(id:'employees_data_import_type')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Import new people (basic)')
    driver.find_element(id:'employees_data_import_import').send_keys "employee_basic.xlsx"
    driver.find_element(id:'submit-import').click
  end

  def bulk_upload_update_employee_info
    driver.find_element(id:'employees_data_import_type').click
    drop = driver.find_element(id:'employees_data_import_type')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Update existing people')
    driver.find_element(id:'employees_data_import_import').send_keys ".xlsx"
    driver.find_element(id:'submit-import').click
  end

  def bulk_upload_jobs
    driver.find_element(id:'employees_data_import_type').click
    drop = driver.find_element(id:'employees_data_import_type')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, '')
    driver.find_element(id:'employees_data_import_import').send_keys "jobs_details.xlsx"
    driver.find_element(id:'submit-import').click
  end

  def bulk_upload_salaries
    driver.find_element(id:'employees_data_import_type').click
    drop = driver.find_element(id:'employees_data_import_type')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Salaries')
    driver.find_element(id:'employees_data_import_import').send_keys "salary.xlsx"
    driver.find_element(id:'submit-import').click
  end
  
  def bulk_upload_benefits
    driver.find_element(id:'employees_data_import_type').click
    drop = driver.find_element(id:'employees_data_import_type')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Benefits')
    driver.find_element(id:'employees_data_import_import').send_keys "benefits.xlsx"
    driver.find_element(id:'submit-import').click
  end

  def bulk_upload_additional_payments
    driver.find_element(id:'employees_data_import_type').click
    drop = driver.find_element(id:'employees_data_import_type')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Additional payments')
    driver.find_element(id:'employees_data_import_import').send_keys "additional_payments.xlsx"
    driver.find_element(id:'submit-import').click
  end

end
