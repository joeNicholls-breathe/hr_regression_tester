# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class CalendarSubscriptionExtension < Base
  def calendar_central_setting_on
    driver.find_element(id: 'manage_account').click
    driver.find_element(xpath: '/html/body/section[2]/form/div/div/p/input').click
    # see page check
  end

  def add_department_list_item_one
    driver.find_element(css: 'body > section.content.container.p-4 > div.float-right > a').click
    driver.find_element(css: '#departments_').click
    driver.find_element(xpath: '//*[@id="new_calendar_subscription"]/div[3]/input').click
  end

  def amend_calendar_revert_settings
    driver.find_element(css: 'body > section.content.container.p-4 > div.float-right > span > span').click
    driver.find_element(xpath: '//*[@id="reset_setup_modal"]/div/div/div[3]/a').click
  end

  def calendar_allow_manage_own
    driver.find_element(xpath: '//*[@id="manage_employee"]').click
    driver.find_element(xpath: '/html/body/section[2]/form/div/div/p/input').click
    driver.find_element(xpath: '//*[@id="_flag_employee_can_see_own_calendar"]').click
    driver.find_element(xpath: '/html/body/section[2]/form/div/div/p/input').click
    driver.find_element(xpath: '/html/body/section[2]/div[1]/a').click
  end

  def enable_own_leave_from_profile_leave_admin
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/a[1]').click
    driver.find_element(xpath: '//*[@id="new_calendar_subscription"]/input[3]').click
    # see page check
  end

  def amend_calendar_revert_settings_from_own
    driver.find_element(css: 'body > section.content.container.p-4 > div.float-right > span > span').click
    driver.find_element(xpath: '//*[@id="reset_setup_modal"]/div/div/div[3]/a').click
  end
end
