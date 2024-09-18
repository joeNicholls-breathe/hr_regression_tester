# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize

class CancelPLanExtension < Base
  def cancel_account
    driver.find_element(css: 'a[data-element-id=side-nav-l1-item-prefix-configure]').click
    sleep 0.1
    driver.find_element(css: 'a[data-element-id=side-nav-l2-item-prefix-plan_billing]').click
    sleep 0.1
    driver.find_element(id: 'cancel-plan-link').click
    sleep 0.25
    drop = driver.find_element(id: 'cancellation_reason')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, 'Too expensive')
    driver.find_element(id: 'additional_cancellation_info')
          .send_keys("Test automation cancelling the account for accurate reporting on the system #{todays_date}")
    driver.find_element(id: 'cancellation_confirmation').click
    driver.find_element(id: 'cancel-modal-button').click
    sleep 0.1
    acount_id = driver.find_element(css: '#cancel_account > div > div > div.modal-body.text-left >
      div > div:nth-child(1) > p:nth-child(1)')
    attribute_value = acount_id.attribute('innerHTML')
    account_no = attribute_value.split[12]
    id = account_no.gsub(/[^a-zA-Z0-9]/, '')
    driver.find_element(id: 'company-name-input').send_keys("Regression Account1 #{id}")
    sleep 0.1
    driver.find_element(xpath: '//*[@id="cancel_account"]/div/div/div[3]/button[2]').click
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
