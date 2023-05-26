require File.expand_path('../base.rb', __FILE__)

class CancelPLanExtension < Base
  def cancel_account
    driver.find_element(xpath: '').click
    driver.find_element(xpath: '').click
    driver.find_element(xpath: '').click
    driver.find_element(xpath: '').click
    driver.find_element(xpath: '').click
    driver.find_element(xpath: '').click
    driver.find_element(xpath: '').click
  end
end