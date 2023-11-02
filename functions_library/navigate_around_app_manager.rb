# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class AppNavigationExtensionManager < Base
  def navigate_to_employee_dashboard_as_manager
    driver.find_element(xpath: '//*[@id="tab-my-dashboard-link"]/span').click
  end

  def navigate_to_dashboard
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[2]/a').click
  end

  def navigate_to_my_dashboard
    driver.find_element(id: 'tab-my-dashboard-link').click
  end

  def navigate_to_people_list
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[3]').click
  end

  def navigate_to_people_screen_pill
    driver.find_element(xpath: '//*[@id="tab-hr-dashboard"]/div[1]/div[2]/a[1]').click
  end

  def navigate_to_add_new_employee
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[3]').click
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[3]/div/a[3]').click
  end

  def navigate_to_settings_without_welcome_page_active
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[6]').click
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[6]/div/a[2]').click
  end

  def navigate_to_settings_with_welcome_page_active
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[7]').click
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[7]/div/a[2]').click
  end

  def navigate_to_settings_without_welcome_page_active_hr_user
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[6]/a').click
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[6]/div/a').click
  end

  def navigate_to_settings_with_welcome_page_active_hr_user
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[7]').click
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[7]/div/a').click
  end

  def navigate_to_company_holidays
    driver.navigate.to('https://hr.breathehrstaging.com/company_holidays')
  end

  def navigate_to_company_blackouts
    driver.navigate.to('https://hr.breathehrstaging.com/company_blackouts')
  end

  def navigate_to_plan_and_billing
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[7]').click
    driver.find_element(css: 'href="/account/plan_and_billing"').click
  end

  def search_employee_hr
    driver.find_element(id: 'quicksearch').send_keys 'HR User'
    sleep 1
  end

  def search_employee_harold
    driver.find_element(id: 'quicksearch').send_keys 'Harold Rasputin'
    sleep 1
  end

  def manager_logout
    driver.find_element(id: 'user-menu-dropdown').click
    driver.find_element(xpath: '/html/body/div[3]/div/div[3]/ul/li[4]/a/img').click
  end

  def user_logout
    driver.find_element(id: 'user-menu-dropdown').click
    driver.find_element(xpath: '/html/body/div[3]/div/div[3]/ul/li[4]/a/img').click
  end

  def pop_modal_price_increase
    driver.find_element(css: '#pricing-dismiss').click
  end
end
