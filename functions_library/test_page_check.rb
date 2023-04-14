require File.expand_path('../base.rb', __FILE__)

class TestPageCheck
  def check_pending_starters
    binding.pry
    @Search_Start_Date = driver.find_element(xpath: '//*[@id="tab-hr-dashboard"]/div[2]/div[2]/div[3]/div[2]/div[2]').attribute
    string s = new.string(@Search_Start_Date)
    string s1 = new.string('Starting on 14/04/2023') ##today plus 1
  end
end 