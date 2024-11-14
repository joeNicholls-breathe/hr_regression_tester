# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class MultiFactorExtension < Base
  # 2FA
  def twofa_everyone_on
    driver.find_element(css: 'label.btn.btn-danger.toggle-off').click
    sleep 0.25
    driver.find_element(id: 'enable-submit').click
    sleep 0.25
    driver.find_element(id: 'confirm-enable').click
  end
end
