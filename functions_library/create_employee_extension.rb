# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class CreateEmployeeExtension < Base
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def create_employee_pending_starter_from_people_page
    sleep 1
    driver.find_element(css: 'body > section.content.container > div.float-right > a').click
    driver.find_element(id: 'employee_first_name').send_keys 'Newemployee'
    driver.find_element(id: 'employee_last_name').send_keys 'User'
    driver.find_element(id: 'employee_email').send_keys "pendingstarter#{random_number_string}@regressionaccount.com"
    driver.find_element(id: 'employee_jobs_attributes_0_title').send_keys 'Pending Starter Test'
    driver.find_element(id: '#employee_join_date_react').send_keys tomorrow
    ## may not be able to do this on a new account as id are new for the account
    # although we could scan the url and find them
    # driver.find_element(id: 'employee_company_department_id').send_keys ""
    # driver.find_element(id: 'employee_company_location_id').send_keys ""
    driver.find_element(id: 'employee_employee_ref').send_keys random_number_string
    driver.find_element(id: 'employee_gets_statutory_true').click
    driver.find_element(id: 'employee_statutory_holiday_country_id').click
    drop = driver.find_element(id: 'employee_statutory_holiday_country_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, '1')
    driver.find_element(xpath: '//*[@id="new_employee"]/p/input').click
  end

  def make_pending_starter_a_finance_user
    driver.find_element(xpath: '//*[@id="quicksearch"]').send_keys 'Newemployee User'
    sleep 0.5
    # profile more - permissions
    driver.find_element(xpath: '//*[@id="more-link"]/span').click
    driver.find_element(xpath: '//*[@id="permissions"]').click
    # edit
    driver.find_element(css: 'body > section.content.container > div.employee-section-header > div > a > span').click
    driver.find_element(id: 'employee_finance_true').click
    # may need to scroll page
    driver.find_element(xpath: '//*[@id="update-employee-button"]').click
  end

  def create_hr_user
    driver.find_element(id: 'employee_first_name').send_keys 'HR'
    driver.find_element(id: 'employee_last_name').send_keys 'User'
    driver.find_element(id: 'employee_email').send_keys "hr#{random_number_string}@regressionaccount.com"
    driver.find_element(id: 'employee_jobs_attributes_0_title').send_keys 'HR User on account'
    driver.find_element(id: 'employee_employee_ref').send_keys("HR User #{todays_date_string}")
    driver.find_element(id: '#employee_join_date_react').send_keys yesterday
    driver.find_element(id: 'employee_gets_statutory_true').click
    driver.find_element(id: 'employee_statutory_holiday_country_id').click
    drop = driver.find_element(id: 'employee_statutory_holiday_country_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, '1')
    driver.find_element(xpath: '//*[@id="new_employee"]/p/input').click
  end

  def make_hr_user
    # profile more - permissions
    driver.find_element(xpath: '//*[@id="more-link"]/span').click
    driver.find_element(xpath: '//*[@id="permissions"]').click
    # edit
    driver.find_element(css: 'body > section.content.container > div.employee-section-header > div > a > span').click
    driver.find_element(id: 'employee_hr_true').click
    # may need to scroll page
    driver.find_element(xpath: '//*[@id="update-employee-button"]').click
  end

  def create_line_manager_user
    driver.find_element(id: 'employee_first_name').send_keys 'Line'
    driver.find_element(id: 'employee_last_name').send_keys 'Manager'
    driver.find_element(id: 'employee_email').send_keys "lm#{random_number_string}@regressionaccount.com"
    driver.find_element(id: 'employee_jobs_attributes_0_title').send_keys 'LM User on account'
    driver.find_element(id: 'employee_employee_ref').send_keys("LM User #{todays_date_string}")
    driver.find_element(id: '#employee_join_date_react').send_keys yesterday
    driver.find_element(id: 'employee_gets_statutory_true').click
    driver.find_element(id: 'employee_statutory_holiday_country_id').click
    drop = driver.find_element(id: 'employee_statutory_holiday_country_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, '1')
    driver.find_element(xpath: '//*[@id="new_employee"]/p/input').click
  end

  def make_lm_user
    # profile more - permissions
    driver.find_element(xpath: '//*[@id="more-link"]/span').click
    driver.find_element(xpath: '//*[@id="permissions"]').click
    # edit
    driver.find_element(css: 'body > section.content.container > div.employee-section-header > div > a > span').click
    driver.find_element(id: 'employee_line_manager_true').click
    # may need to scroll page
    driver.find_element(xpath: '//*[@id="update-employee-button"]').click
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
end
