require File.expand_path('../base.rb', __FILE__)

class PageValueCheck
  def checking_pending_starter
    @Search_Start_Date = find_element(xpath: '//*[@id="tab-hr-dashboard"]/div[2]/div[2]/div[3]/div[2]/div[2]').attribute
    string s = new.string(@Search_Start_Date)
    string s1 = new.string('Starting on ' + tomorrow) ##today plus 1
  end
end 
