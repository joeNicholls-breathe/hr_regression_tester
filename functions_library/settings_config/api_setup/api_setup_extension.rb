# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class APIExtenion < Base
  def api_key_switch_on
    driver.find_element(xpath: '//*[@id="api-status"]/fieldset/p/button').click
    driver.find_element(xpath: '//*[@id="api-confirm"]/div/div/form/div[2]/p[2]/input').click
    driver.find_element(xpath: '//*[@id="api-confirm"]/div/div/form/div[3]/input').click
    sleep 10
  end

  def api_key_switch_reset
    driver.find_element(id: 'update_api_key').click
  end
end
