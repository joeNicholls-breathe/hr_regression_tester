# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class ManagerDashboardExtension < Base
  def switch_todos_to_training
    driver.find_element(id: 'tab-training').click
  end

  def switch_todos_to_sickness
    driver.find_element(id: 'tab-sicknesses').click
  end

  def view_open_training_request
    driver.find_element(
      css: '#tab-panel-training > div > table > tbody > tr > td.bdds-table__table-data.bdds-table__table-data--column-align-right > span > a' # rubocop:disable Layout/LineLength
    ).click
  end

  def view_open_sickness_request
    driver.find_element(
      css: '#tab-panel-sicknesses > div > table > tbody > tr > td.bdds-table__table-data.bdds-table__table-data--column-align-right > span > a' # rubocop:disable Layout/LineLength
    ).click
  end

  def open_sickness_id_from_dashboard
    open_sickness = driver.find_element(
      css: '#tab-panel-sicknesses > div > table > tbody > tr > td.bdds-table__table-data.bdds-table__table-data--column-align-right > span > a' # rubocop:disable Layout/LineLength
    )
    sickness_id = open_sickness.attribute('href')
    sickness_id.split('/')[6]
  end

  def find_employee_requested_training
    todo = driver.find_elements(class: 'bdds-table__table-row')
    todo[0].find_element(class: 'bdds-table__table-data--column-align-left').text
  end

  def find_next_7_days_requested_training
    driver.find_element(
      css: '#training > div > table > tbody > tr > td.bdds-table__table-data.bdds-table__table-data--column-align-left > span > p.bdds-text.bdds-text--ui-small.bdds-text--style-normal.bdds-text--weight-regular.text--light' # rubocop:disable Layout/LineLength
    ).text
  end

  def description_of_open_training
    row = @driver.find_element(class: 'bdds-table__table-row')
    columns = row.find_elements(tag_name: 'TD')
    columns.find { |x| x.attribute('cellIndex') == '1' }.text
  end
end
