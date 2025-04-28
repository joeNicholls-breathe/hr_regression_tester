# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class EmployeeProfileExtension < Base
  def open_employee_training
    driver.find_element(id: 'training').click
  end

  def open_employee_sickness
    driver.find_element(id: 'sickness').click
  end

  def open_employee_leave
    driver.find_element(id: 'leave').click
  end

  def value_from_table(row, col)
    rows = driver.find_elements(class: 'odd')
    driver.find_elements(class: 'even') << rows
    chosen_row = rows.find { |x| x.attribute('_DT_RowIndex') == row }
    columns = chosen_row.find_elements(tag_name: 'TD')
    columns.find { |x| x.attribute('cellIndex') == col }
  end

  def find_value_in_show_page(chosen_row)
    table = driver.find_element(class: 'table')
    rows = table.find_elements(tag_name: 'TR')
    row = rows.find { |x| x.attribute('rowIndex') == chosen_row }
    row.text
  end

  def open_show_page_from_table(row)
    rows = driver.find_elements(class: 'odd')
    driver.find_elements(class: 'even') << rows
    chosen_row = rows.find { |x| x.attribute('_DT_RowIndex') == row }
    actions = chosen_row.find_element(class: 'actions')
    row_actions = actions.find_elements(tag_name: 'A')
    row_actions.find { |x| x.attribute('title') == 'view report' }.click
  end

  def check_for_empty_table
    driver.find_element(class: 'blankstate').displayed?
  end
end
