# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class HrUserConfigExtension < Base
  def hr_user_configuration_leave_needs_approval
    driver.find_element(id: 'account_hr_leave_needs_approval').click
  end

  def hr_user_configuration_use_gravatar
    driver.find_element(id: 'account_use_gravatar').click
  end

  def hr_user_configuration_disable_welcome_page
    driver.find_element(id: 'account_getting_started_finished').click
  end

  def hr_user_configuration_use_bradford_factor
    driver.find_element(id: 'account_use_bradford_factor').click
  end

  def hr_user_configuration_remind_line_manager_to_give_121_off
    driver.find_element(id: 'one-to-one-frequency-checkbox').click
  end

  def hr_user_configuration_remind_line_manager_to_give_121_on
    driver.find_element(id: 'one-to-one-frequency-checkbox').click
    sleep 1
    driver.find_element(id: 'account_one_to_one_frequency').clear
    driver.find_element(id: 'account_one_to_one_frequency').send_keys '14'
  end

  def hr_user_configuration_grapevine_label_clear
    driver.find_element(id: 'account_grapevine_label').clear
  end

  def hr_user_configuration_grapevine_label
    driver.find_element(id: 'account_grapevine_label').send_keys("Regression Test #{todays_date_string}")
  end

  def exclude_salary
    driver.find_element(id: 'account_exclude_salary_from_missing_data_report').click
  end

  def update_hr_settings
    driver.find_element(css: '#edit_account_3899 > div > div > p > input').click
  end
end
