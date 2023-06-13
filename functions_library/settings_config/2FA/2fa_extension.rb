require File.expand_path('../base.rb', __FILE__)

class MultiFactorExtension < Base
#2FA
  def twofa_everyone_on
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/div/div[3]/div[2]/div/div/label[1]').click
  end 

  def twofa_everyone_off
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/div/div[3]/div[2]/div/div/label[2]').click
  end 

  def twofa_hrusers_on
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/div/div[4]/div[2]/div/div/label[1]').click
  end

  def twofa_hrusers_off
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/div/div[4]/div[2]/div/div/label[2]').click
  end

  def twofa_line_manager_on
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/div/div[5]/div[2]/div/div/label[1]').click
  end

  def twofa_line_manager_off
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/div/div[5]/div[2]/div/div/label[2]').click
  end

  def twofa_financeusers_on
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/div/div[6]/div[2]/div/div/label[1]').click
  end

  def twofa_financeusers_off
    driver.find_element(xpath: '/html/body/section[2]/div[3]/div/div/div[6]/div[2]/div/div/label[2]').click
  end
end
