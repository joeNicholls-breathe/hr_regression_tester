# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class BuyNowExtension < Base
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def buy_now_monthly_micro_no_modules_positive
    # plan
    driver.find_element(xpath: '//*[@id="monthly"]/div/div[1]/div/div[1]/input').click
    driver.find_element(id: 'submit-modal-button').click
    # modals
    driver.find_element(id: 'account_use_expenses_0').click
    driver.find_element(id: 'account_recruitment_none').click
    driver.find_element(id: 'account_use_rta_0').click
    driver.find_element(id: 'account_use_learn_0').click
    driver.find_element(id: 'update-chargeable-modules-btn').click
    # address
    driver.find_element(id: 'account_address1').send_keys 'Testing House'
    driver.find_element(id: 'account_address2').send_keys 'Tesing Street'
    driver.find_element(id: 'account_address3').send_keys 'Testing District'
    driver.find_element(id: 'account_city').send_keys 'London'
    driver.find_element(id: 'account_county').send_keys 'Greater London'
    driver.find_element(id: 'account_postcode').send_keys 'EC1N 9PL'
    drop = driver.find_element(id: 'account_country_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, '183')
    drop = driver.find_element(id: 'account_industry')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, 'Production')
    # scroll to button
    element = driver.find_element(css: 'input.btn:nth-child(1)')
    driver.execute_script('arguments[0].scrollIntoView(true);', element)
    sleep 0.25
    # submit form
    driver.find_element(css: 'input.btn:nth-child(1)').click
    # subscription breakdown - check total £80.40
    subs_check = driver.find_element(xpath: '/html/body/section[2]/div[1]/div/div[2]/table[3]/tbody/tr[3]/td')
    total_cost = subs_check.attribute('innerHTML')
    s = total_cost.to_s
    puts s
    driver.find_element(id: 'open-stripe-card-details-modal').click
    # stripe modal
    driver.find_element(id: 'account_payment_contact_name').send_keys 'AdminBuyNow'
    driver.find_element(id: 'account_payment_contact_email')
          .send_keys("admin#{random_number_string}@regressionaccount.com")
    driver.find_element(id: 'account_payment_contact_phone').send_keys '123'
    driver.switch_to.frame(driver.find_element(css: '#card-element iframe'))
    driver.find_element(name: 'cardnumber').send_keys '4242424242424242'
    driver.find_element(name: 'exp-date').send_keys '0927'
    driver.find_element(name: 'cvc').send_keys '123'
    driver.find_element(name: 'postal').send_keys '45691'
    driver.switch_to.default_content
    driver.find_element(id: 'card-button').click
    sleep 1
    driver.find_element(id: '/html/body/section[2]/div[1]/div/a').click
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
end
