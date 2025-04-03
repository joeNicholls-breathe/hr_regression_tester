# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

# rubocop:disable Metrics/AbcSize
# rubocop:disable Layout/LineLength
# rubocop:disable Metrics/ClassLength
# rubocop:disable Metrics/MethodLength

class AppNavigationExtensionLM < Base
  def lm_dashboard
    driver.find_element(css: '#tab-hr-dashboard-link > span:nth-child(1)').click
  end

  def my_people
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-people]').click
    sleep 1
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-my_people]').click
  end

  def my_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270')
  end

  def my_employees_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22271')
  end

  def my_employee_leave
    driver.find_element(id: 'leave').click
  end

  def view_leave_request_record
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a > svg').click
  end

  def approve_employee_leave_request
    a = driver.find_element(class: 'edit_leave_request')
    attribute_value = a.attribute('id')
    split_value = attribute_value.split('_')[3]
    selector = "#edit_leave_request_#{split_value} > div.modal-footer > input"
    driver.find_element(xpath: '/html/body/section[2]/div[4]/div[2]/button[2]').click
    driver.find_element(css: selector).click
  end

  def return_to_employee_leave
    driver.find_element(xpath: '/html/body/section[2]/div[2]/a').click
  end

  def add_leave_for_my_employee
    driver.find_element(css: 'body > div.hr-main-container > div.hr-main > section > div.employee-section-header > div > a').click
  end

  def cancel_employee_leave_request
    driver.find_element(xpath: '//*[@id="tabs-0"]/li[2]/a').click # move to booked (if needed)
    # number of leave in list check tr.even?
    driver.find_element(css: '#DataTables_Table_1 > tbody > tr > td.actions > a:nth-child(2) > svg').click
    driver.find_element(xpath: '//*[@id="leave_request_cancellation_reason"]')
          .send_keys('Cancel Employee leave request')
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def cancel_employee_booked_leave
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(2) > svg').click
    driver.find_element(id: 'leave_request_cancellation_reason')
          .send_keys("Cancelled by Line managers LM on #{todays_date_string}")
    driver.find_element(xpath: '//*[@id="new_leave_request"]/p/input').click
  end

  def delete_leave_request
    leave_request = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(1)')
    button_href = leave_request.attribute('href')
    leave_id = button_href.split('/')[6]
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > svg').click
    driver.find_element(css: "#delete_pending_leave_request_#{leave_id} > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm").click
  end

  def return_to_employee_leave_index
    driver.find_element(css: 'body > div.hr-main-container > div.hr-main > section > div.breadcrumb > a').click
  end

  def add_toil
    # doesnt appear to be interactible although the other buttons are??
    driver.find_element(:xpath, '//*[text() = "TOIL"]').click
    puts 'user can see toil button'
    driver.find_element(:xpath, '//input[@id=string(//label[text() = "Amount of days to remove"])]').send_keys '1'
    # using xpath
    driver.find_element(:xpath, '//input[@placeholder = "Date"]').click
    driver.find_element(:xpath, '(//*[text() = "1"])[2]').click
    driver.find_element(:xpath, '(//input[@placeholder = "Date"])[2]').click
    driver.find_element(:xpath, '(//*[text() = "1"])[2]').click
    driver.find_element(:xpath, '//input[@id=string(//label[text() = "Reason"])]').click
    driver.find_element(:xpath, '//input[@id=string(//label[text() = "Reason"])]').clear
    driver.find_element(:xpath, '//input[@id=string(//label[text() = "Reason"])]').send_keys '1'
    driver.find_element(:xpath, '//input[@value = "log TOIL"]').click
    # using ids
    # driver.find_element(css: '#employee_holiday_year_adjustment_adjustment_hours').send_keys '1'
    # driver.find_element(css: '#employee_holiday_year_adjustment_adjustment_minutes').send_keys '30'
    driver.find_element(id: 'employee_holiday_year_adjustment_adjustment').send_keys '1'
    driver.find_element(id: '#employee_holiday_year_adjustment_earned_from_date_react').send_keys one_week_ago_string
    driver.find_element(id: '#employee_holiday_year_adjustment_earned_to_date_react').send_keysb one_week_ago_string
    driver.find_element(id: 'employee_holiday_year_adjustment_reason').send_keys one_week_ago_string
    driver.find_element(css: '#new_employee_holiday_year_adjustment > div.modal-footer > input').click
    puts 'User added TOIL'
  end

  def add_adjustment_additional
    driver.find_element(:css, 'div.card-body > #increase > svg.svg-inline--fa.fa-plus.fa-w-14 > path').click
    driver.find_element(:css, '#increase-leave-allowance-modal > div.modal-dialog > div.modal-content >
      #new_employee_holiday_year_adjustment > div.modal-body.text-left > div.form-group >
      #employee_holiday_year_adjustment_adjustment').clear
    driver.find_element(:css, '#increase-leave-allowance-modal > div.modal-dialog >
      div.modal-content > #new_employee_holiday_year_adjustment > div.modal-body.text-left >
      div.form-group > #employee_holiday_year_adjustment_adjustment').send_keys '2'
    driver.find_element(:css, '#increase-leave-allowance-modal > div.modal-dialog > div.modal-content >
      #new_employee_holiday_year_adjustment > div.modal-body.text-left > div.form-group >
      #employee_holiday_year_adjustment_reason').send_keys 'Test added 2 additional days leave'
    driver.find_element(:xpath, '//input[@value = "Increase allowance"]').click
    puts 'User added Adjustment +'
  end

  def subtract_adjustment_subtrack
    driver.find_element(:css, 'div.card-body > #decrease > svg.svg-inline--fa.fa-minus.fa-w-14 > path').click
    driver.find_element(:css, '#decrease-leave-allowance-modal > div.modal-dialog > div.modal-content >
      #new_employee_holiday_year_adjustment > div.modal-body.text-left > div.form-group >
      #employee_holiday_year_adjustment_adjustment').clear
    driver.find_element(:css, '#decrease-leave-allowance-modal > div.modal-dialog > div.modal-content >
      #new_employee_holiday_year_adjustment > div.modal-body.text-left > div.form-group >
      #employee_holiday_year_adjustment_adjustment').send_keys '1'
    driver.find_element(:css, '#decrease-leave-allowance-modal > div.modal-dialog > div.modal-content >
      #new_employee_holiday_year_adjustment > div.modal-body.text-left > div.form-group >
      #employee_holiday_year_adjustment_reason').send_keys 'Test reduced by 1 days leave'
    driver.find_element(:xpath, '//input[@value = "Decrease allowance"]').click
    puts 'User added Adjustment -'
  end

  def return_to_dashboard
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-dashboard]').click
    sleep 0.25
  end

  def return_to_dashboard_error_page_not_found
    driver.find_element(css: '#wrapper > div > p:nth-child(3) > a').click
  end

  def create_a_sickness
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22271/sicknesses/new')
    sleep 1
    driver.find_element(id: '#sickness_start_date_react').send_keys yesterday
    driver.find_element(id: '#sickness_end_date_react').send_keys yesterday
    sleep 1
    drop = driver.find_element(id: 'sickness_company_sicknesstype_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Other')
    driver.find_element(xpath: '//*[@id="new_sickness"]/p/input').click
  end

  def navigate_to_sickness_view_own_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/sicknesses')
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a > svg').click
    puts 'user can view sickness'
  end

  def navigate_to_sickness_edit
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22271/sicknesses')
    a = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(1)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[6]
    selector = "#edit_sickness_#{split_value} > p > input"
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a > svg').click
    driver.find_element(css: '#sickness_reason').send_keys("Edited by LMs LM on #{todays_date_string}")
    driver.find_element(css: selector).click
    puts 'user edited sickness record'
  end

  def navigate_to_sickness_manage_own_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/sicknesses')
    a = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(1)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[6]
    selector = "#edit_sickness_#{split_value} > p > input"
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(2) > svg').click
    driver.find_element(id: 'complete-sickness').click
    driver.find_element(css: selector).click
    puts 'User can manage sickness'
  end

  def delete_sickness_direct_own_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/sicknesses')
    sleep 0.25
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(2) > svg').click
    a = driver.find_element(css: 'body > div.hr-main-container > div.hr-main > section > div.employee-section-header > div > a:nth-child(1)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[6]
    selector = "#delete_sickness_#{split_value} > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm"
    driver.find_element(css: 'body > div.hr-main-container > div.hr-main > section > div.employee-section-header > div > span > span').click
    driver.find_element(css: selector).click
  end

  def delete_sickness_employees_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22271/sicknesses')
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(2) > svg').click
    a = driver.find_element(css: 'body > div.hr-main-container > div.hr-main > section > div.employee-section-header > div > a:nth-child(1)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[6]
    selector = "#delete_sickness_#{split_value} > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm"
    driver.find_element(css: 'body > div.hr-main-container > div.hr-main > section > div.employee-section-header > div > span > span >
     svg.svg-inline--fa.fa-trash-alt.fa-w-14.fa-inverse.fa-stack-1x').click
    driver.find_element(css: selector).click
  end

  def navigate_to_learn_own_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/learn/courses')
    driver.find_element(xpath: '//*[@id="learn"]/span').click
    puts 'user can view learn'
  end

  def navigate_to_performance_own_employee
    # 121s
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/performance')
    driver.find_element(css: '#DataTables_Table_0 > thead > tr > th.sort-desc.sorting_desc').click
    puts 'User navigated to view performance 121'
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/one_to_ones/140298/edit')
    # can not user URl as line managers currently have permissions to access this via the URL
    puts 'User has ability to edit 121 record'
    driver.find_element(id: 'one_to_one_employee_summary').send_keys("Edited on #{todays_date_string}")
    driver.find_element(css: '#edit_one_to_one_140298 > p > input').click
    puts 'User can manage(edit) 121 record'
  end

  def return_to_performance_home
    driver.find_element(css: 'body > div.hr-main-container > div.hr-main > section > div.breadcrumb > a').click
  end

  def navigate_to_objectives
    driver.find_element(css: '#tabs-0 > li:nth-child(2) > a').click
    driver.find_element(css: '#DataTables_Table_1 > tbody > tr > td.actions > a > svg').click
    puts 'User navigated to view performance objective'
    driver.find_element(css: '#objective_notes').send_keys("Edited on #{todays_date_string}")
    driver.find_element(css: '#edit_objective_203 > p > input').click
    puts 'User can manage(edit) objective record'
    driver.find_element(css: 'body > section.content.container.p-4 > div.employee-section-header > div > span > span > svg.svg-inline--fa.fa-trash-alt.fa-w-14.fa-inverse.fa-stack-1x').click
    puts 'User can delete objective record'
  end

  def navigate_to_deliverables
    driver.find_element(css: '#tabs-0 > li:nth-child(3) > a').click
    # button not present we seem to have a enhancement to add this into the system
    # driver.find_element(css: '#DataTables_Table_2 > tbody > tr > td.actions > a > svg').click
    puts 'User navigated to view performance deliverables'
    driver.find_element(css: 'body > section.content.container.p-4 > div.employee-section-header > div > a:nth-child(2) > span').click
    puts 'User can manage(edit) deliverable records'
  end

  def navigate_to_documents_own_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/documents')
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(3) > svg').click
    driver.find_element(css: '#employee_document_title').send_keys '1'
    driver.find_element(css: '#edit_employee_document_1107 > p > input').click
  end

  def document_delete_own_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/documents')
    a = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(3)')
    attribute_value = a.attribute('href')
    split_value = attribute_value.split('/')[6]
    selector = "#delete_employee_document_#{split_value} > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm"
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > svg').click
    driver.find_element(css: selector).click
  end

  def navigate_to_jobs_own_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/jobs')
    puts 'User navigated to employees jobs'
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(1)').click
    puts 'User can view employees jobs'
  end

  def manage_employee_job
    driver.find_element(id: 'employee_job_title').clear
    driver.find_element(id: 'employee_job_title').send_keys("Employee Of LM #{todays_date_string}")
    driver.find_element(xpath: '//*[@id="edit_employee_job_4471"]/fieldset/p/input').click
    puts 'If hits in test_1006c then - FAIL'
  end

  def delete_job
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/span/span').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(4)').click
  end

  def navigate_to_remuneration_own_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/pay_and_benefits')
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a > svg').click
    puts 'User can view pay salary'
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/salaries/712/edit')
    driver.find_element(xpath: '//*[@id="employee_salary_amount"]').clear
    driver.find_element(xpath: '//*[@id="employee_salary_amount"]').send_keys '25000.00'
    driver.find_element(xpath: '//*[@id="edit_employee_salary_712"]/p/input').click
    puts 'User can manage pay salary'
  end

  def delete_remuneration_own_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/pay_and_benefits')
    delete_pay = driver.find_element(css: 'body > section.content.container > div.employee-section-header > div > a:nth-child(1)')
    attribute_value = delete_pay.attribute('href')
    split_value = attribute_value.split('/')[6]
    selector = "#delete_salary_#{split_value} > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm"
    driver.find_element(css: 'body > section.content.container > div.employee-section-header >
      div > span > span > svg.svg-inline--fa.fa-circle.fa-w-16.fa-stack-2x').click
    driver.find_element(css: selector).click
  end

  def breadcrumb_to_performance_home
    driver.find_element(xpath: '/html/body/div[4]/div[1]/section/div[2]/a').click
  end

  def navigate_to_employees_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22271')
    driver.find_element(xpath: '//*[@id="tab-summary"]/div[1]/a').click
  end

  def performance_121_delete_employee_of_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22271/performance#one-to-ones')
    sleep 1
    delete_oto = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(3)')
    attribute_value = delete_oto.attribute('href')
    split_value = attribute_value.split('/')[6]
    selector = "#delete_one_to_one_#{split_value} > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm"
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > svg').click
    driver.find_element(css: selector).click
  end

  def performance_objective_delete_employee_of_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22271/performance#objectives')
    sleep 1
    delete_objective = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(2)')
    attribute_value = delete_objective.attribute('href')
    split_value = attribute_value.split('/')[6]
    selector = "#delete_objective_#{split_value} > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm"
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > svg').click
    driver.find_element(css: selector).click
  end

  def performance_deliverable_delete_employee_of_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22271/performance#deliverables')
    sleep 1
    delete_deliverable = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(3)')
    attribute_value = delete_deliverable.attribute('href')
    split_value = attribute_value.split('/')[6]
    selector = "#delete_deliverables_#{split_value} > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm"
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > svg').click
    driver.find_element(css: selector).click
  end

  def job_delete_employee_of_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22271/jobs')
    sleep 0.25
    delete_job = driver.find_element(css: '#DataTables_Table_0 > tbody > tr.odd > td.actions > a:nth-child(2)')
    value = delete_job.attribute('href')
    job_value = value.split('/')[6]
    selector = "#delete_job_#{job_value} > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm"
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > svg').click
    driver.find_element(css: selector).click
  end

  def pay_delete_employee_of_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22271/pay_and_benefits')
    sleep 1
    delete_pay = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(2)')
    attribute_value = delete_pay.attribute('href')
    split_value = attribute_value.split('/')[6]
    selector = "#delete_salary_#{split_value} > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm"
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > svg').click
    driver.find_element(css: selector).click
  end

  def performance_121_create_employee_of_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22271/one_to_ones/new?employee_id=22271')
    sleep 0.25
    driver.find_element(id: 'undefined_react').send_keys one_month_date_string
    # all drop downs
    drop = driver.find_element(css: '#new_one_to_one > fieldset:nth-child(2) > div:nth-child(3) >
     div:nth-child(2) > div > div.mobile-time-picker-row.d-flex.align-items-stretch >
      select:nth-child(2)')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, '14')
    drop = driver.find_element(css: '#new_one_to_one > fieldset:nth-child(2) > div:nth-child(3) >
     div:nth-child(2) > div > div.mobile-time-picker-row.d-flex.align-items-stretch >
      select:nth-child(4)')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, '15')
    drop = driver.find_element(id: 'one_to_one_company_one_to_one_type_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Informal')
    drop = driver.find_element(id: 'one_to_one_reviewer_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'LM Employee User')
    drop = driver.find_element(id: 'one_to_one_company_location_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Auto Regression Setup Test')
    driver.find_element(css: '#recurring-one-to-one_recurring-one-to-one_false').click
    driver.find_element(css: '#new_one_to_one > p > input').click
  end

  def performance_objective_create_employee_of_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22271/objectives/new')
    sleep 0.25
    driver.find_element(id: 'objective_subject').send_keys "LM taest input #{todays_date_string}"
    driver.find_element(id: 'objective_description').send_keys 'Test'
    driver.find_element(id: '#objective_target_date_on_react').send_keys one_month_date_string
    drop = driver.find_element(id: 'objective_state')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'confirmed')
    driver.find_element(css: '#new_objective > p > input').click
  end

  def performance_deliverable_create_employee_of_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22271/deliverables/new')
    sleep 0.25
    driver.find_element(id: 'employee_deliverable_description').send_keys "Deliverable description #{todays_date_string}"
    driver.find_element(id: '#employee_deliverable_delivery_date_react').send_keys one_month_date_string
    driver.find_element(css: '#new_employee_deliverable > p > input').click
  end

  def job_create_employee_of_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22271/jobs/new')
    sleep 0.25
    driver.find_element(id: 'employee_job_title').send_keys "New Job #{todays_date_string}"
    # driver.find_element(id: '#employee_job_start_date_react').send_keys one_month_date_string
    drop = driver.find_element(id: 'employee_job_fulltime_parttime')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'Full-Time')
    driver.find_element(css: '#new_employee_job > fieldset > p > input').click
  end

  def pay_create_employee_of_employee
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22271/salaries/new')
    sleep 0.25
    driver.find_element(id: 'employee_salary_amount').send_keys '35000.00'
    driver.find_element(id: 'employee_salary_reason_for_change').send_keys "New Pay test #{todays_date_string}"
    drop = driver.find_element(id: 'employee_salary_basis')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'per annum')
    drop = driver.find_element(id: 'employee_salary_pay_frequency')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:text, 'monthly')
    driver.find_element(id: '#employee_salary_start_date_react').send_keys one_month_date_string
    driver.find_element(css: '#new_employee_salary > p > input').click
  end

  def homepage_logo
    driver.find_element(css: 'body > div.hr-nav-container > div:nth-child(2) > div > div > nav >
     div > div:nth-child(1) > div.sidenav__logo > a').click
  end

  def reset_sickness_emp_return_to_work
    driver.navigate.to('https://hr.breathehrstaging.com/employees/22270/sicknesses/1911/edit')
    sleep 0.25
    driver.find_element(id: 'sickness_status_returned').click
    driver.find_element(css: '#edit_sickness_1911 > p > input').click
  end
end

# rubocop:enable Metrics/AbcSize
# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/ClassLength
# rubocop:enable Metrics/MethodLength
