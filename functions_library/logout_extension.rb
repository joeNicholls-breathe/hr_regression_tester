# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class LogoutExtension < Base
  def user_logout
    driver.find_element(css: 'button[data-element-id=header-avatar-menu-button]').click
    driver.find_element(css: 'a[data-element-id=header-avatar-menu-item-logout]').click
  end

  def logout_admin
    driver.find_element(class: 'bdds-avatar__image').click
    driver.find_element(css: 'a[data-element-id=header-avatar-menu-item-logout]').click
  end
end
