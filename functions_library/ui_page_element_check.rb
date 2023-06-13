require File.expand_path('../base.rb', __FILE__)

class PageValueCheck < Base
  def checking_pending_starter
    pending_starter = driver.find_element(xpath: '//*[@id="tab-hr-dashboard"]/div[2]/div[2]/div[3]/div[2]/div[2]')
    starter_date = pending_starter.attribute("innerHTML")
    s = starter_date.to_s
    s1 = "Starting on " + tomorrow.strftime("%d/%m/%Y")
    puts s == s1
  end
end 
