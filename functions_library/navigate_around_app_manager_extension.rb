# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class AppNavigationExtensionManager < Base
  def navigate_to_employee_dashboard_as_manager
    driver.find_element(xpath: '//*[@id="tab-my-dashboard-link"]/span').click
  end

  def navigate_to_dashboard
    driver.find_element(id: 'top-menu-menu-item-1-0').click
  end

  def navigate_to_my_dashboard
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-dashboard]').click
  end

  def navigate_to_people_list
    driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[3]').click
  end

  def navigate_to_people_screen
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-people]').click
    sleep 0.25
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-our_people]').click
  end

  def navigate_to_add_new_employee
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-people]').click
    sleep 0.25
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-add_new_people]').click
  end

  def navigate_to_settings_without_welcome_page_active
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-configure]').click
    sleep 0.25
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-settings]').click
  end

  def navigate_to_settings_with_welcome_page_active
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-configure]').click
    sleep 0.25
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-settings]').click
  end

  def navigate_to_settings_without_welcome_page_active_hr_user
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-configure]').click
    sleep 0.25
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-settings]').click
  end

  def navigate_to_settings_with_welcome_page_active_hr_user
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-configure]').click
    sleep 0.25
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-settings]').click
  end

  def navigate_to_holiday_years
    driver.navigate.to('https://hr.breathehrstaging.com/account/holiday_years')
  end

  def navigate_to_company_holidays
    driver.navigate.to('https://hr.breathehrstaging.com/company_holidays')
  end

  def navigate_to_company_blackouts
    driver.navigate.to('https://hr.breathehrstaging.com/company_blackouts')
  end

  def navigate_to_plan_and_billing
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-configure]').click
    sleep 0.25
    driver.find_element(css: 'href="/account/plan_and_billing"').click
  end

  def navigate_to_rota_employee_add_holiday
    driver.navigate.to('https://hr.breathehrstaging.com/employees/26349/leave_requests/new')
  end

  def navigate_to_rota_employee_add_sickness
    driver.navigate.to('https://hr.breathehrstaging.com/employees/26349/sicknesses/new')
  end

  def navigate_to_rota_employee_sickness
    driver.navigate.to('https://hr.breathehrstaging.com/employees/26349/sicknesses')
  end

  def search_employee_hr
    driver.find_element(css: 'input[data-element-id=header-employee-search]').send_keys 'HR User'
    sleep 1
    driver.find_element(css: 'input[data-element-id=header-employee-search]').send_keys :enter
    sleep 1
  end

  def search_employee_harold
    driver.find_element(css: 'input[data-element-id=header-employee-search]').send_keys 'Harold Rasputin'
    sleep 1
    driver.find_element(css: 'input[data-element-id=header-employee-search]').send_keys :enter
    sleep 1
  end

  def manager_logout
    driver.find_element(css: 'button[data-element-id=header-avatar-menu-button]').click
    sleep 0.25
    driver.find_element(css: 'a[data-element-id=header-avatar-menu-item-logout]').click
  end

  def user_logout
    driver.find_element(css: 'button[data-element-id=header-avatar-menu-button]').click
    sleep 0.25
    driver.find_element(css: 'a[data-element-id=header-avatar-menu-item-logout]').click
  end

  def pop_modal_price_increase
    driver.find_element(css: '#pricing-dismiss').click
  end
end
