require File.expand_path('../base.rb', __FILE__)

class AppNavigationExtension < Base
  def return_to_dashboard
    driver.find_element(: '').click
  end
end