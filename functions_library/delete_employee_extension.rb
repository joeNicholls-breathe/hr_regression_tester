# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class DeleteEmployeeExtension < Base
  def delete_employee_hr_user
    driver.find_element(
      css: 'body > div.hr-main-container > div > section > div.employee-section-header > div > a:nth-child(2)'
    ).click
    driver.find_element(id: 'delete-employee-checkbox').click
    driver.find_element(id: 'delete-employee-button').click
  end
end
