require File.expand_path('../base.rb', __FILE__)

class AppNavigationExtensionEmployee < Base
  def navigate_to_dashboard_employee
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[1]/a').click
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
