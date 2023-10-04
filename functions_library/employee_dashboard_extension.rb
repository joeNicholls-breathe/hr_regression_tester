# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class EmployeeDashboardExtension < Base
  def my_dashboard
    driver.find_element(xpath: '//*[@id="tab-my-dashboard-link"]/span').click
  end

  def make_holiday_request
    leave_request_button = driver.find_element(css: '#tab-my-dashboard > div > div:nth-child(1) > div.card-footer > a')
    button_href = leave_request_button.property('href')
    employee_id = button_href.split('/')[-3]
    driver.find_element(css: "a[href='/employees/#{employee_id}/leave_requests/new']").click
  end

  def view_holiday_request
    leave_request_button = driver.find_element(css: '#tab-my-dashboard > div > div:nth-child(1) > div.card-footer > a')
    button_href = leave_request_button.property('href')
    employee_id = button_href.split('/')[-3]
    driver.find_element(css: "a[href='/employees/#{employee_id}/holidays']").click
  end
end
