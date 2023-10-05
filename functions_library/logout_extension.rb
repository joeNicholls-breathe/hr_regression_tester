# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class LogoutExtension < Base
  def user_logout
    driver.find_element(id: 'user-menu-dropdown').click
    driver.find_element(css: "a[href='/employees/sign_out']").click
  end
end
