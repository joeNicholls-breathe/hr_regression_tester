# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)
class LoginAppExtension < Base
  def select_hr
    a = wait.until { driver.find_element(class: 'hr') }
    a.click
  end

  def select_saas
    a = wait.until { driver.find_element(class: 'saas') }
    a.click
  end

  def select_rota
    a = wait.until { driver.find_element(class: 'rta') }
    a.click
  end
end
