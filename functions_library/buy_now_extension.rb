# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class BuyNowExtension < Base
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def buy_now_monthly_micro_no_modules_positive
    # plan
    # ISSUES with this selection dropdown react component
    # driver.find_element(xpath: '//*[text() = "Regular - Monthly (up to 50 people)"]').click
    # driver.find_element(xpath: '//*[text() = "Micro - Monthly (up to 10 people)"]').click
    # drop = driver.find_element(xpath: '//*[text() = "Regular - Monthly (up to 50 people)"]')
    # choose = Selenium::WebDriver::Support::Select.new(drop)
    # choose.select_by(:value, 'Micro - Monthly (up to 10 people)')
    # all these buttons work
    # modals switch all on
    driver.find_element(css: 'div.addRemoveModule.plus-sign').click
    driver.find_element(css: 'div.addRemoveModule.plus-sign').click
    driver.find_element(css: 'div.addRemoveModule.plus-sign').click
    driver.find_element(css: 'div.addRemoveModule.plus-sign').click
    driver.find_element(css: 'div.addRemoveModule.plus-sign').click
    # continue
    driver.find_element(xpath: '//*[text() = "Continue"]').click
    sleep 0.25
    # address
    driver.find_element(id: 'address1').send_keys 'Testing House'
    driver.find_element(id: 'address2').send_keys 'Tesing Street'
    driver.find_element(id: 'address3').send_keys 'Testing District'
    driver.find_element(id: 'city').send_keys 'London'
    driver.find_element(id: 'county').send_keys 'Greater London'
    driver.find_element(id: 'postcode').send_keys 'EC1N 9PL'
    # uk based business
    driver.find_element(id: 'uk_business').click
    # industry
    driver.find_element(xpath: '//*[text() = "Select an option"]').click
    driver.find_element(xpath: '//*[text() = "Business administration and support services"]').click
    # new from blaze
    driver.find_element(id: 'payment_method').click
    driver.find_element(css: 'body > div.hr-main-container > div > section > div > form >
      div.row > div:nth-child(1) > div.payment-form > div > div > div > a:nth-child(1)').click
    driver.find_element(id: 'payment_contact_name').send_keys 'AdminBuyNow'
    driver.find_element(id: 'payment_contact_email').send_keys("admin#{random_number_string}@regressionaccount.com")
    driver.find_element(id: 'payment_contact_phone').send_keys '01342 777666'
    # stripe modal
    driver.switch_to.frame(driver.find_element(css: '#card-element iframe'))
    driver.find_element(name: 'cardnumber').send_keys '4242424242424242'
    driver.find_element(name: 'exp-date').send_keys '0927'
    driver.find_element(name: 'cvc').send_keys '123'
    driver.find_element(name: 'postal').send_keys '45691'
    driver.switch_to.default_content
    # check plan is correctly updated - subscription breakdown total with VAT £87.60
    subs_check = driver.find_element(css: 'body > div.hr-main-container > div > section > div > form > div.row >
      div.col-lg-6.payment-summary-container > div > div > div > section:nth-child(5) > div:nth-child(7)')
    total_cost = subs_check.attribute('innerHTML')
    s = total_cost.to_s
    puts s
    puts 'Compare to check - number from sire should be £87.60'
    driver.find_element(xpath: '//*[text() = "Buy now"]').click
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
end
