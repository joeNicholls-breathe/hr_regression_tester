require File.expand_path('../base.rb', __FILE__)

class PageValueCheck < Base
  def checking_pending_starter
    pending_starter = driver.find_element(xpath: '//*[@id="tab-hr-dashboard"]/div[2]/div[2]/div[3]/div[2]/div[2]')
    starter_date = pending_starter.attribute("innerHTML")
    s = starter_date.to_s
    s1 = "Starting on " + tomorrow.strftime("%d/%m/%Y")
    puts s == s1
  end

  def api_prod_key_check
    api_key = driver.find_element(xpath: '//*[@id="api-status"]/fieldset[1]/table/tbody/tr[1]/td')
    account_key = api_key.attribute("innerHTML")
    s = account_key.to_s
    puts s
  end

  def url_check
    url_check = driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr/td[2]')
    calendar_url = url_check.attribute("innerHTML")
    s = calendar_url.to_s
    puts s
  end

  def calendar_subscription_manage_centrally_url
    url_check = driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr/td[2]')
    calendar_url = url_check.attribute("innerHTML")
    s = calendar_url.to_s
    puts s
  end

  def calendar_subscription_manage_own_leave_url
    url_check = driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[2]/td[2]')
    calendar_url = url_check.attribute("innerHTML")
    s = calendar_url.to_s
    puts s
  end
end 
