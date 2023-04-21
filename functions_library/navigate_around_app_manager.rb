require File.expand_path('../base.rb', __FILE__)

class AppNavigationExtensionManager < Base
  def navigate_to_employee_dashboard_as_manager
    driver.find_element(xpath: '//*[@id="tab-my-dashboard-link"]/span').click
  end

  def navigate_to_people_screen_pill
    driver.find_element(xpath: '//*[@id="tab-hr-dashboard"]/div[1]/div[2]/a[1]').click
  end

  def navigate_to_settings
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[6]').click
    driver.find_element(css: 'href="/account/settings"').click
  end

end
