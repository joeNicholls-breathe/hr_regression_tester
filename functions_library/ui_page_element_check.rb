# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)
# rubocop:disable Layout/LineLength
class PageValueCheck < Base
  def checking_pending_starter
    pending_starter = driver.find_element(xpath: '//*[@id="tab-hr-dashboard"]/div[2]/div[2]/div[3]/div[2]/div[2]')
    starter_date = pending_starter.attribute('innerHTML')
    s = starter_date.to_s
    s1 = "Starting on #{tomorrow}"
    puts s == s1
  end

  def api_prod_key_check
    api_key = driver.find_element(xpath: '//*[@id="api-status"]/fieldset[1]/table/tbody/tr[1]/td')
    account_key = api_key.attribute('innerHTML')
    s = account_key.to_s
    puts s
  end

  def url_check
    url_check = driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr/td[2]')
    calendar_url = url_check.attribute('innerHTML')
    s = calendar_url.to_s
    puts s
  end

  def calendar_subscription_manage_centrally_url
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr/td[2]')
    calendar_url = url_check.attribute('innerHTML')
    s = calendar_url.to_s
    puts s
  end

  def calendar_subscription_manage_own_leave_url
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[2]/td[2]')
    calendar_url = url_check.attribute('innerHTML')
    s = calendar_url.to_s
    puts s
  end

  def sign_up_error_negative_journey
    signup_check = driver.find_element(id: 'submit-button')
    sign_up_url = signup_check.attribute('innerHTML')
    s = sign_up_url.to_s
    puts s
  end

  def signup_fail_check
    return puts 'Dashboard reached' if driver.find_element(xpath: '//*[@id="navbar-nav-dropdown"]/ul/li[1]/a')
  rescue Selenium::WebDriver::Error::NoSuchElementError
    puts 'Check - Account was not Signed Up - TEST Pass - Element not Found'
  end

  def account_active
    buy_now_positive = driver.find_element(css: 'div.row:nth-child(1)')
    buy_now_positive('innerHTML')
    puts buy_now_positive
  end

  def check_leave_has_ben_requested
    hrleaverequest = driver.find_element(css: '#DataTables_Table_0 > tbody > tr')
    hrleaverequest('innerHTML')
    puts hrleaverequest
    lr = '0.5 day requested'
    puts lr == hrleaverequest
  end

  def leave_request_clashes_with_existing_absence
    return puts 'absence created' if driver.find_element(css: "a[href='/employees/20717/absences']")
  rescue Selenium::WebDriver::Error::NoSuchElementError
    puts 'Check - Pass - Absence not created - Clashes with existing absence'
  end

  def leave_request_clashes_with_blackout_check
    return puts 'absence created' if driver.find_element(css: "a[href='/employees/20717/absences']")
  rescue Selenium::WebDriver::Error::NoSuchElementError
    puts 'Check - Pass - Absence not created - Clashes with company blackout'
  end

  def employee_leave_remaining
    a = driver.find_element(css: 'body > section.content.container > div.row > div > div > table > tbody > tr:nth-child(3) > td')
    # leave_deduction = driver.find_element(xpath: '/html/body/section[2]/div[5]/div/div/table/tbody/tr[3]/td')
    leave_remaining = a.attribute('innerHTML')
    puts "Check - #{leave_remaining} remain available"
  end

  def sickness_current_state_view_only
    a = driver.find_element(css: 'body > section.content.container > div.row > div > div > table > tbody > tr:nth-child(1) > td')
    current_state = a.attribute('innerHTML')
    puts "Check - #{current_state} should still be Return to Work"
  end

  def more_than_one_open_sickness_record
    return puts 'Pass - Sickness not created - Employee can only have one open sickness' if
      driver.find_element(css: '#new_sickness > fieldset > div.start-section > div.form-group.has-error')
  rescue Selenium::WebDriver::Error::NoSuchElementError
    puts 'Sickness created'
  end

  def show_number_of_employees_on_people_list
    a = driver.find_element(css: '#DataTables_Table_0_info')
    number_employees = a.attribute('innerHTML')
    puts number_employees
    req_output = 'Showing 1 to 7 of 7 entries'
    puts req_output == number_employees
  end

  def billing_history
    driver.save_screenshot('billing history screenshot.png')
  end
  # rubocop:enable Layout/LineLength
end
