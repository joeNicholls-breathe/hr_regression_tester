# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)
class LoginAppExtension < Base
  def select_hr
    driver.find_element(class: 'hr').click
  end

  def select_saas
    driver.find_element(class: 'saas').click
  end

  def select_rota
    driver.find_element(class: 'rta').click
  end
end
