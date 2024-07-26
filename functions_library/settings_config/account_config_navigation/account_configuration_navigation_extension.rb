# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class NavigationAroundAccountConfiguration < Base
  def navigate_to_company_details
    driver.find_element(xpath: '/html/body/section[2]/div[2]/div[1]/div[1]/a[1]').click
  end

  def navigate_back_to_settings_breadcrumb
    driver.find_element(css: 'body > section.content.container.p-4 > div.breadcrumb.mb-2 > a').click
  end

  def navigate_back_to_settings_breadcrumb_email_notification
    driver.find_element(css: 'body > section.content.container.p-4 > div.row > div > div > a').click
  end

  def navigate_to_modules_chargable
    driver.find_element(xpath: '/html/body/section[2]/div[2]/div[1]/div[1]/a[2]').click
  end

  def navigate_to_modules_free
    driver.find_element(xpath: '//*[@id="tabs-0"]/li[2]/a').click
  end

  def navigate_to_picklist
    driver.find_element(xpath: '/html/body/section[2]/div[2]/div[1]/div[1]/a[3]').click
  end

  def return_to_picklist_menu
    driver.find_element(xpath: '/html/body/section[2]/div[1]/a').click
  end

  def navigate_to_email_notifications
    driver.find_element(xpath: '/html/body/section[2]/div[2]/div[1]/div[1]/a[4]').click
  end

  def navigate_to_two_factor_authentication
    driver.find_element(css: 'a[href="/account/edit_mfa_configuration"]').click
  end

  def navigate_to_change_what_hr_users_can_do
    driver.find_element(
      css: 'body > div.hr-main-container > div > section > div:nth-child(2) >
       div:nth-child(1) > div:nth-child(3) > a:nth-child(2)'
    ).click
  end

  def navigate_to_change_what_hr_users_can_do_as_hr
    driver.find_element(
      css: 'body > div.hr-main-container > div > section > div:nth-child(2) > 
       div:nth-child(1) > div:nth-child(2) > a:nth-child(2)'
    ).click
  end

  def navigate_to_change_what_line_managers_can_do
    driver.find_element(
      css: 'body > section.content.container.p-4 > div:nth-child(2) >
            div:nth-child(1) > div:nth-child(3) > a:nth-child(3)'
    ).click
  end

  def navigate_to_change_what_employees_can_do
    driver.navigate.to('https://hr.breathehrstaging.com/account/edit_employee_configuration')
  end

  def navigate_to_woking_patterns
    driver.find_element(
      css: 'body > section.content.container.p-4 > div:nth-child(2) >
            div:nth-child(2) > div:nth-child(1) > a:nth-child(2) > svg'
    ).click
  end

  def navigate_to_holiday_allowances
    driver.find_element(
      css: 'body > section.content.container.p-4 > div:nth-child(2) >
            div:nth-child(2) > div:nth-child(1) > a:nth-child(3)'
    ).click
  end

  def navigate_to_holiday_years
    driver.find_element(
      css: 'body > section.content.container.p-4 > div:nth-child(2) >
            div:nth-child(2) > div:nth-child(1) > a:nth-child(4)'
    ).click
  end

  def navigate_to_company_holidays
    driver.find_element(
      css: 'body > section.content.container.p-4 >
            div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > a:nth-child(5)'
    ).click
  end

  def navigate_to_company_blackout
    driver.find_element(
      css: 'body > section.content.container.p-4 > div:nth-child(2) >
            div:nth-child(2) > div:nth-child(1) > a:nth-child(6)'
    ).click
  end

  def navigate_to_api_setup
    driver.find_element(
      css: 'body > section.content.container.p-4 > div:nth-child(2) >
            div:nth-child(2) > div:nth-child(2) > a:nth-child(2)'
    ).click
  end

  def navigate_to_calendar_subscriptions
    driver.find_element(
      css: 'body > section.content.container.p-4 > div:nth-child(2) >
            div:nth-child(2) > div:nth-child(2) > a:nth-child(3)'
    ).click
  end

  def navigate_to_rota_cloud
    driver.find_element(
      css: 'body > section.content.container.p-4 > div:nth-child(2) >
            div:nth-child(2) > div:nth-child(2) > a:nth-child(4)'
    ).click
  end
end
