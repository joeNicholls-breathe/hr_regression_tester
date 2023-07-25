require File.expand_path('../../../base.rb', __FILE__)

class AccountDetailsExtension < Base
  def company_details_data_entry_edit_positive
    driver.find_element(xpath: '/html/body/section[2]/div[2]/a').click
    #company address
    driver.find_element(id: 'account_name').clear
    driver.find_element(id: 'account_name').send_keys "Regression Setup Account Ltd"
    driver.find_element(id: 'account_address1').clear
    driver.find_element(id: 'account_address1').send_keys "Testing House"
    driver.find_element(id: 'account_address2').clear
    driver.find_element(id: 'account_address2').send_keys "Testing Lane"
    driver.find_element(id: 'account_address3').clear
    driver.find_element(id: 'account_address3').send_keys "Testing Town"
    driver.find_element(id: 'account_city').clear
    driver.find_element(id: 'account_city').send_keys "London"
    driver.find_element(id: 'account_county').clear
    driver.find_element(id: 'account_county').send_keys "Greater London"
    #scroll page
    element = driver.find_element(id: 'account_contact_name')
    driver.execute_script('arguments[0].scrollIntoView(true);', element)
    sleep 0.15
    driver.find_element(id: 'account_postcode').clear
    driver.find_element(id: 'account_postcode').send_keys "EC1N 3RD"
    driver.find_element(id: 'account_country_id').send_keys "273"
    #company contact
    driver.find_element(id: 'account_contact_name').clear
    driver.find_element(id: 'account_contact_name').send_keys "Administrator User"
    driver.find_element(id: 'account_contact_number').clear
    driver.find_element(id: 'account_contact_number').send_keys "0207 654 2580"
    driver.find_element(id: 'account_contact_email').clear
    driver.find_element(id: 'account_contact_email').send_keys "info@regressionaccount.com"
    #additional company info
    #scroll page
    element = driver.find_element(id: 'account_charity_name')
    driver.execute_script('arguments[0].scrollIntoView(true);', element)
    sleep 0.15
    drop = driver.find_element(id:'account_area')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, "South East")
    drop = driver.find_element(id:'account_industry')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, "Finance and insurance")
    #charity settings - non std
    driver.find_element(id: 'account_charity_name').clear
    driver.find_element(id: 'account_charity_name').send_keys "Regression Account Ltd"
    driver.find_element(id: 'account_subscription_attributes_charity_number').clear
    driver.find_element(id: 'account_subscription_attributes_charity_number').send_keys "4354129"
    driver.find_element(id: 'account_subscription_attributes_registered_charity_name').clear
    driver.find_element(id: 'account_subscription_attributes_registered_charity_name').send_keys "Regression Account Ltd"
    driver.find_element(id: 'account_subscription_attributes_charity_sort_code').clear
    driver.find_element(id: 'account_subscription_attributes_charity_sort_code').send_keys "040004"
    driver.find_element(id: 'account_subscription_attributes_charity_bank_account_number').clear
    driver.find_element(id: 'account_subscription_attributes_charity_bank_account_number').send_keys "12345678"
    #domain
    driver.find_element(id: 'account-name-change-disclaimer').click
    driver.find_element(id: 'account_domain').clear
    driver.find_element(id: 'account_domain').send_keys "regressionaccountdomain"
    #company logo
    #driver.find_element(id: 'account_logo').send_keys "" #need to find an image to upload and reference it here to the file
    #company payrite reference
    #driver.find_element(id: 'account_payrite_ref').sendkeys "159654"
    #remuneration currency
    drop = driver.find_element(id:'account_remuneration_currency_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, "17")
    #hr partner code - non std
    #driver.find_element(id: 'account_partner_company_reference').sendkeys "215"
    #referral code - non std
    #driver.find_element(id: 'account_referred_by_code').sendkeys "" #need to find some data from a referral code withing staging
    #submit info
    #scroll page
    element = driver.find_element(css: '#edit_account_3899 > p > input')
    driver.execute_script('arguments[0].scrollIntoView(true);', element)
    sleep 0.15
    driver.find_element(css: '#edit_account_3899 > p > input').click
  end

  def company_details_data_entry_cancel_changes
    driver.find_element(xpath: '/html/body/section[2]/div[2]/a').click
    #company address
    driver.find_element(id: 'account_name').clear
    driver.find_element(id: 'account_name').send_keys "Regression Setup Account Ltd"
    driver.find_element(id: 'account_address1').clear
    driver.find_element(id: 'account_address1').send_keys "Testing House"
    driver.find_element(id: 'account_address2').clear
    driver.find_element(id: 'account_address2').send_keys "Testing Lane"
    driver.find_element(id: 'account_address3').clear
    driver.find_element(id: 'account_address3').send_keys "Testing Town"
    driver.find_element(id: 'account_city').clear
    driver.find_element(id: 'account_city').send_keys "London"
    driver.find_element(id: 'account_county').clear
    driver.find_element(id: 'account_county').send_keys "Greater London"
    #scroll page
    element = driver.find_element(id: 'account_contact_name')
    driver.execute_script('arguments[0].scrollIntoView(true);', element)
    sleep 0.15
    driver.find_element(id: 'account_postcode').clear
    driver.find_element(id: 'account_postcode').send_keys "EC1N 3RD"
    driver.find_element(id: 'account_country_id').send_keys "273"
    #company contact
    driver.find_element(id: 'account_contact_name').clear
    driver.find_element(id: 'account_contact_name').send_keys "Administrator User"
    driver.find_element(id: 'account_contact_number').clear
    driver.find_element(id: 'account_contact_number').send_keys "0207 654 2580"
    driver.find_element(id: 'account_contact_email').clear
    driver.find_element(id: 'account_contact_email').send_keys "info@regressionaccount.com"
    #additional company info
    #scroll page
    element = driver.find_element(id: 'account_charity_name')
    driver.execute_script('arguments[0].scrollIntoView(true);', element)
    sleep 0.15
    drop = driver.find_element(id:'account_area')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, "South East")
    drop = driver.find_element(id:'account_industry')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, "Finance and insurance")
    #charity settings - non std
    driver.find_element(id: 'account_charity_name').clear
    driver.find_element(id: 'account_charity_name').send_keys "Regression Account Ltd"
    driver.find_element(id: 'account_subscription_attributes_charity_number').clear
    driver.find_element(id: 'account_subscription_attributes_charity_number').send_keys "4354129"
    driver.find_element(id: 'account_subscription_attributes_registered_charity_name').clear
    driver.find_element(id: 'account_subscription_attributes_registered_charity_name').send_keys "Regression Account Ltd"
    driver.find_element(id: 'account_subscription_attributes_charity_sort_code').clear
    driver.find_element(id: 'account_subscription_attributes_charity_sort_code').send_keys "040004"
    driver.find_element(id: 'account_subscription_attributes_charity_bank_account_number').clear
    driver.find_element(id: 'account_subscription_attributes_charity_bank_account_number').send_keys "12345678"
    #domain
    driver.find_element(id: 'account-name-change-disclaimer').click
    driver.find_element(id: 'account_domain').clear
    driver.find_element(id: 'account_domain').send_keys "regressionaccountdomain"
    drop = driver.find_element(id:'account_remuneration_currency_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, "17")
    #submit info
    #scroll page
    element = driver.find_element(css: '#edit_account_3899 > p > input')
    driver.execute_script('arguments[0].scrollIntoView(true);', element)
    sleep 0.15
    #cancel form
    driver.find_element(css: '#edit_account_3899 > p > a').click
  end

end
