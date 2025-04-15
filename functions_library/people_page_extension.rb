# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class PeoplePageExtension < Base
  def people_page_filter; end

  def people_page_bulk_assign; end

  def select_employee_from_list(alt)
    tags = driver.find_elements(tag_name: 'IMG')
    tag = tags.find { |w| w.attribute('alt') == alt }
    tag.click
  end

  def select_employee_from_lm_list(employee_name)
    rows = driver.find_elements(class: 'odd')
    driver.find_elements(class: 'even') << rows
    row = rows.find { |x| x.find_element(class: 'sorting_1').text == employee_name }
    actions = row.find_element(class: 'actions')
    actions.find_element(tag_name: 'A').click
  end
end
