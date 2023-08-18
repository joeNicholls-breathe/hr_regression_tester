require File.expand_path('../../../base.rb', __FILE__)

class NavigationAroundAccountConfiguration < Base
#Navigation
  def navigate_to_company_details
    driver.find_element(xpath: '/html/body/section[2]/div[2]/div[1]/div[1]/a[1]').click
  end

  def navigate_back_to_settings_breadcrumb
    driver.find_element(css: 'body > section.content.container.p-4 > div.breadcrumb.mb-2 > a').click
  end

  def navigate_to_modules_chargable
    driver.find_element(xpath: '/html/body/section[2]/div[2]/div[1]/div[1]/a[2]').click
  end

  def navigate_to_modules_free
    driver.find_element(xpath: '//*[@id="tabs-0"]/li[2]/a').click
  end

  def navigate_to_picklist
  driver.find_element(css: 'href="/account/picklists"').click
  end

  def navigate_to_email_notifications
    driver.find_element(css: 'href="/account/edit_email_configuration"').click
  end

  def navigate_to_two_factor_authentication
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div[1]/div[2]/a').click
  end

  def navigate_to_change_what_hr_users_can_do
    driver.find_element(css: 'href="/account/edit_staff_configuration"').click
  end

  def navigate_to_change_what_line_managers_can_do
    driver.find_element(css: 'href="/account/line_manager_permissions"').click
  end

  def navigate_to_change_what_employees_can_do
    driver.find_element(css: 'href="/account/edit_employee_configuration"').click
  end

  def navigate_to_woking_patterns
    driver.find_element(css: 'href="/account_working_patterns"').click
  end

  def navigate_to_holiday_allowances
    driver.find_element(css: 'href="/account_holiday_allowances"').click
  end

  def navigate_to_holiday_years
    driver.find_element(css: 'href="/account/holiday_years"').click
  end

  def navigate_to_company_holidays
    driver.find_element(css: 'href="/company_holidays"').click
  end

  def navigate_to_company_blackout
    driver.find_element(css: 'href="/company_blackouts"').click
  end

  def navigate_to_api_setup
    driver.find_element(css: 'href="/account/api_setup"').click
  end

  def navigate_to_calendar_subscriptions
    driver.find_element(css: 'href="/account/calendar_syncing"').click
  end

  def navigate_to_rota_cloud
    driver.find_element(css: 'href="/account/integrations"').click
  end
end
