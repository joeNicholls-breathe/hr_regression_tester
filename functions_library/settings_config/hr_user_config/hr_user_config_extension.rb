require File.expand_path('../base.rb', __FILE__)

class HrUserConfigExtension < Base
  def hr_user_configuration_leave_needs_approval_on
    driver.find_element(id: 'account_hr_leave_needs_approval').click
  end

  def hr_user_configuration_leave_needs_approval_off
    driver.find_element(: '').click
  end

  def hr_user_configuration_use_gravatar_on
    driver.find_element(id: 'account_use_gravatar').click
  end

  def hr_user_configuration_use_gravatar_off
    driver.find_element(id: 'account_use_gravatar').click
  end

  def hr_user_configuration_disable_welcome_page_on
    driver.find_element(id: 'account_getting_started_finished').click
  end

  def hr_user_configuration_disable_welcome_page_off
    driver.find_element(id: 'account_getting_started_finished').click
  end

  def hr_user_configuration_use_bradford_factor_on
    driver.find_element(id: 'account_use_bradford_factor').click
  end

  def hr_user_configuration_use_bradford_factor_off
    driver.find_element(id: 'account_use_bradford_factor').click
  end

  def hr_user_configuration_remind_line_manager_to_give_121_on
    driver.find_element(id: 'one-to-one-frequency-checkbox').click
    driver.find_element(id: 'account_one_to_one_frequency').sendkeys "5"
  end

  def hr_user_configuration_remind_line_manager_to_give_121_off
    driver.find_element(id: 'one-to-one-frequency-checkbox').click
  end

  def hr_user_configuration_grapevine_label
    driver.find_element(id: 'account_grapevine_label').senkeys "Regression Test add value DATE TODAY"
  end

  def update_hr_settings
    driver.find_element(class: 'btn btn-success').click
  end

  def cancel_hr_settings
    driver.find_element(css: 'href="/account/settings"').click
  end
end
