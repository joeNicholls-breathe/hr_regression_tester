require File.expand_path('../base.rb', __FILE__)

class LoginAppExtension < Base
  def select_hr
    driver.find_element(class: 'hr').click
  end
end
