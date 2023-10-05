# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class NavigateAroundAppEmployee < Base
  def set_employee
    leave_request_button = driver.find_element(css: '#tab-my-dashboard > div > div:nth-child(1) > div.card-footer > a')
    button_href = leave_request_button.property('href')
    button_href.split('/')[-3]
  end

  def navigate_to_dashboard_employee
    driver.find_element(css: 'href="/dashboard"').click
  end

  def navigate_to_profile_employee
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[2]/a').click
  end

  def navigate_to_company_dropdown_employee
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[3]/a').click
  end

  def navigate_to_calendar_employee
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[4]/a').click
  end
end
