# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

# rubocop:disable Metrics/ClassLength
class LoginExtension < Base
  # rubocop:disable Metrics/AbcSize
  def login_pass
    driver.find_element(id: 'email-input').send_keys settings[:staging][:test_direct_admin_email]
    sleep 0.5
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 0.5
    driver.find_element(css: 'form button[type=submit]').click
    sleep 0.5
  end

  def login_fail
    driver.find_element(id: 'email-input').send_keys settings[:staging][:test_direct_admin_email]
    sleep 1
    driver.find_element(name: 'password').send_keys 'failOnPassword'
    sleep 1
    driver.find_element(css: 'form button[type=submit]').click
    sleep 1
  end

  def login_admin
    driver.find_element(id: 'email-input').send_keys settings[:staging][:admin_email]
    sleep 1
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 1
    driver.find_element(css: 'form button[type=submit]').click
    sleep 1
  end

  def login_employee
    driver.find_element(id: 'email-input').send_keys settings[:staging][:employee_email]
    sleep 1
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 1
    driver.find_element(css: 'form button[type=submit]').click
    sleep 1
  end

  def login_holiday_employee
    driver.find_element(id: 'email-input').send_keys settings[:staging][:holiday_employee_email]
    sleep 1
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 1
    driver.find_element(css: 'form button[type=submit]').click
    sleep 1
  end

  def login_carry_over_holiday_employee
    driver.find_element(id: 'email-input').send_keys settings[:staging][:carry_over_holiday_email]
    sleep 1
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 1
    driver.find_element(css: 'form button[type=submit]').click
    sleep 1
  end

  def login_negative_carry_over_holiday_employee
    driver.find_element(id: 'email-input').send_keys settings[:staging][:nagative_carry_over_holiday_email]
    sleep 1
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 1
    driver.find_element(css: 'form button[type=submit]').click
    sleep 1
  end

  def login_setup_acc_admin
    driver.find_element(id: 'email-input').send_keys settings[:staging][:setup_acc_email]
    sleep 0.5
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 0.5
    driver.find_element(css: 'form button[type=submit]').click
    sleep 0.5
  end

  def login_setup_acc_hr_user
    driver.find_element(id: 'email-input').send_keys settings[:staging][:setup_acc_email_hr_user]
    sleep 0.5
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 0.5
    driver.find_element(css: 'form button[type=submit]').click
    sleep 0.5
  end

  def login_setup_acc_line_manager_user
    driver.find_element(id: 'email-input').send_keys settings[:staging][:setup_acc_email_lm_user]
    sleep 0.5
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 0.5
    driver.find_element(css: 'form button[type=submit]').click
    sleep 0.5
  end

  def login_setup_acc_lm_employee_user
    driver.find_element(id: 'email-input').send_keys settings[:staging][:setup_acc_email_lm_employee]
    sleep 0.5
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 0.5
    driver.find_element(css: 'form button[type=submit]').click
    sleep 0.5
  end

  def login_auto_approval_admin
    driver.find_element(id: 'email-input').send_keys settings[:staging][:admin_auto_approval_email]
    sleep 0.5
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 0.5
    driver.find_element(css: 'form button[type=submit]').click
    sleep 0.5
  end

  def login_auto_approval_employee_one
    driver.find_element(id: 'email-input').send_keys settings[:staging][:auto_approved_one_email]
    sleep 0.5
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 0.5
    driver.find_element(css: 'form button[type=submit]').click
    sleep 0.5
  end

  def login_auto_approval_employee_two
    driver.find_element(id: 'email-input').send_keys settings[:staging][:auto_approved_two_email]
    sleep 0.5
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 0.5
    driver.find_element(css: 'form button[type=submit]').click
    sleep 0.5
  end

  def login_auto_approval_employee_three
    driver.find_element(id: 'email-input').send_keys settings[:staging][:auto_approved_three_email]
    sleep 0.5
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 0.5
    driver.find_element(css: 'form button[type=submit]').click
    sleep 0.5
  end

  def login_auto_approval_employee_four
    driver.find_element(id: 'email-input').send_keys settings[:staging][:auto_approved_four_email]
    sleep 0.5
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 0.5
    driver.find_element(css: 'form button[type=submit]').click
    sleep 0.5
  end

  def login_as_saas_admin
    driver.find_element(id: 'email-input').send_keys settings[:staging][:saas_admin_email]
    sleep 0.5
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 0.5
    driver.find_element(css: 'form button[type=submit]').click
    sleep 0.5
  end

  def login_auto_approval_permissions_employee
    driver.find_element(id: 'email-input').send_keys settings[:staging][:setup_acc_email_perms_employee]
    sleep 0.5
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 0.5
    driver.find_element(css: 'form button[type=submit]').click
    sleep 0.5
  end

  def login_auto_approval_finance_user
    driver.find_element(id: 'email-input').send_keys settings[:staging][:setup_acc_email_perms_finance]
    sleep 0.5
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 0.5
    driver.find_element(css: 'form button[type=submit]').click
    sleep 0.5
  end

  def login_auto_approval_holiday_approver
    driver.find_element(id: 'email-input').send_keys settings[:staging][:setup_acc_email_perms_holiday]
    sleep 0.5
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 0.5
    driver.find_element(css: 'form button[type=submit]').click
    sleep 0.5
  end

  def login_auto_approval_expenses_approver
    driver.find_element(id: 'email-input').send_keys settings[:staging][:setup_acc_email_perms_expenses]
    sleep 0.5
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 0.5
    driver.find_element(css: 'form button[type=submit]').click
    sleep 0.5
  end

  def finance_login
    driver.find_element(id: 'email-input').send_keys settings[:staging][:setup_acc_email_perms_finance]
    sleep 0.5
    driver.find_element(name: 'password').send_keys settings[:staging][:login_password]
    sleep 0.5
    driver.find_element(css: 'form button[type=submit]').click
    sleep 0.5
  end
  # rubocop:enable Metrics/AbcSize
end
# rubocop:enable Metrics/ClassLength
