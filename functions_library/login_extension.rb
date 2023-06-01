require File.expand_path('../base.rb', __FILE__)

class LoginExtension < Base
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
    driver.find_element(name: 'password').send_keys "failOnPassword"
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
  
  def login_setup_acc_admin
    driver.find_element(id: 'email-input').send_keys settings[:staging][:setup_acc_email]
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


end
