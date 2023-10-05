# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class CancelPLanExtension < Base
  def cancel_account
    driver.find_element(id: 'cancel-plan-link').click
    driver.find_element(xpath: '').click
  end
end
