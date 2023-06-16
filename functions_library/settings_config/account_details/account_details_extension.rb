require File.expand_path('../base.rb', __FILE__)

class AccountDetailsExtension < Base
  def company_details_data_entry_edit_positive
    driver.find_element(class: 'href="/account/edit"').click
    #company address
    driver.find_element(id: 'account_name').sendkeys "Regression Setup Account Ltd"
    driver.find_element(id: 'account_address1').sendkeys "Testing House"
    driver.find_element(id: 'account_address2').sendkeys "Testing Lane"
    driver.find_element(id: 'account_address3').sendkeys "Testing Town"
    driver.find_element(id: 'account_city').sendkeys "London"
    driver.find_element(id: 'account_county').sendkeys "Greater London"
    driver.find_element(id: 'account_postcode').sendkeys "EC1N 3RD"
    driver.find_element(id: 'account_country_id').sendkeys "273"
    #company contact
    driver.find_element(id: 'account_contact_name').sendkeys "Administrator User"
    driver.find_element(id: 'account_contact_number').sendkeys "0207 654 2580"
    #driver.find_element(id: account_contact_email').sendkeys "info@regressionaccount.com"
    #additional company info
    driver.find_element(id: 'account_area').select_by("South East")
    driver.find_element(id: 'account_industry').select_by("Finance and insurance")
    #charity settings - non std
    driver.find_element(id: 'account_charity_name').sendkeys "Regression Account Ltd"
    driver.find_element(id: 'account_subscription_attributes_charity_number').sendkeys "4354129"
    driver.find_element(id: 'account_subscription_attributes_registered_charity_name').sendkeys "Regression Account Ltd"
    driver.find_element(id: 'account_subscription_attributes_charity_sort_code').sendkeys "04-00-04"
    driver.find_element(id: 'account_subscription_attributes_charity_bank_account_number').sendkeys "12345678"
    #domain
    driver.find_element(id: 'account_domain').sendkeys "regressionaccountdomain"
    driver.find_element(id: 'account-name-change-disclaimer').click
    #company logo
    driver.find_element(id: 'account_logo').sendkeys "" #need to find an image to upload and reference it here to the file
    #company payrite reference
    #driver.find_element(id: 'account_payrite_ref').sendkeys "159654"
    #remuneration currency
    driver.find_element(id: 'account_remuneration_currency_id').select_by(17)
    #hr partner code - non std
    #driver.find_element(id: 'account_partner_company_reference').sendkeys "215"
    #referral code - non std
    #driver.find_element(id: 'account_referred_by_code').sendkeys "" #need to find some data from a referral code withing staging
    #submit info
    driver.find_element(css: 'data-disable-with="update account"').click
    #cancel form
    #driver.find_element(class: 'btn btn-outline-secondary').click
  end
end
