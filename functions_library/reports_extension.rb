# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class ReportsExtension < Base
  def click_on_report(report_name)
    reports = driver.find_elements(class: 'list-group-item-action')
    chosen_report = reports.find { |x| x.attribute('innerText') == report_name }
    chosen_report.click
  end

  def list_all_elements_of_first_row
    first_row = driver.find_element(class: 'odd')
    first_row.find_elements(tag_name: 'TD')
  end

  def chosen_column_from_first_row(cell_index)
    row_elements = list_all_elements_of_first_row
    specific_row = row_elements.select { |x| x.attribute('cellIndex') == cell_index }
    specific_row[0].text
  end

  def compare_text_of_column_against_expected(expected_text, actual_text)
    if expected_text == actual_text
      puts 'PASS - Column value matches expected'
    else
      puts "Fail #{actual_text} does not match #{expected_text}"
    end
  end

  def click_action_for_selected_row(target_id)
    all_a = driver.find_elements(tag_name: 'A')
    action = all_a.select { |x| x.attribute('href').include? target_id }
    action[0].click
  end

  def check_table_not_empty
    driver.find_element(class: 'odd')
  end

  def check_table_is_empty
    driver.find_element(class: 'blankstate')
  end

  def filter_by_department(department)
    department_filter = driver.find_element(id: 'company_department_id')
    choose = Selenium::WebDriver::Support::Select.new(department_filter)
    choose.select_by(:text, department)
    sleep 1
    driver.find_element(class: 'btn-primary').click
  end

  def filter_by_location(location)
    location_filter = driver.find_element(id: 'company_location_id')
    choose = Selenium::WebDriver::Support::Select.new(location_filter)
    choose.select_by(:text, location)
    sleep 1
    driver.find_element(class: 'btn-primary').click
  end

  def filter_by_start_next_month
    driver.find_element(id: '#start_date_react').send_keys one_month
    puts 'PASS - Start Date added'
    driver.find_element(class: 'btn-primary').click
  end

  def clear_filters
    driver.find_element(class: 'btn-secondary').click
  end
end
