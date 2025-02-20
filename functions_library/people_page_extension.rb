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
end
