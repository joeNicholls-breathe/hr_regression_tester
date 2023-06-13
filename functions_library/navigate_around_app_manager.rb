require File.expand_path('../base.rb', __FILE__)

class AppNavigationExtensionManager < Base
  def navigate_to_employee_dashboard_as_manager
    driver.find_element(xpath: '//*[@id="tab-my-dashboard-link"]/span').click
  end

  def navigate_to_dashboard
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[2]/a').click
  end

  def navigate_to_people_list
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[3]').click
  end

  def navigate_to_people_screen_pill
    driver.find_element(xpath: '//*[@id="tab-hr-dashboard"]/div[1]/div[2]/a[1]').click
  end

  def navigate_to_settings_without_welcome_page_active
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[6]').click
    driver.find_element(css: 'href="/account/settings"').click
  end

  def navigate_to_settings_with_welcome_page_active
    binding.pry
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[7]').click
    driver.find_element(css: 'href="/account/settings"').click
  end

  def navigate_to_plan_and_billing
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[7]').click 
    driver.find_element(css: 'href="/account/plan_and_billing"').click
  end

  def manager_logout
    driver.find_element(id: 'user-menu-dropdown').click
    driver.find_element(xpath: '/html/body/div[3]/div/div[3]/ul/li[5]').click
  end
end
