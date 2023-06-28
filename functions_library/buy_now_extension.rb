require File.expand_path('../base.rb', __FILE__)

class BuyNowExtension < Base
	def buy_now_monthly_micro_no_modules_positive
		#plan
		driver.find_element(xpath: '//*[@id="monthly"]/div/div[1]/div/div[1]/input').click
		driver.find_element(id: 'submit-modal-button').click
		#modals
		driver.find_element(id: 'account_recruitment_none').click
		driver.find_element(id: 'account_use_rta_0').click
		driver.find_element(id: 'account_use_learn_0').click
		driver.find_element(id: 'update-chargeable-modules-btn').click
		#address
		driver.find_element(id: 'account_address1').send_keys "Testing House"
		driver.find_element(id: 'account_address2').sendkeys "Tesing Street"
		driver.find_element(id: 'account_address3').sendkeys "Testing District"
		driver.find_element(id: 'account_city').sendkeys "London"
		driver.find_element(id: 'account_county').sendkeys "Greater London"
		driver.find_element(id: 'account_postcode').sendkeys "EC1N 9PL"
		drop = driver.find_element(id:'account_country_id')
        choose = Selenium::WebDriver::Support::Select.new(drop)
        choose.select_by(:value, "183")
		drop = driver.find_element(id:'account_industry')
        choose = Selenium::WebDriver::Support::Select.new(drop)
        choose.select_by(:value, "Production")
		driver.find_element(xpath: '//*[@id="edit_account"]/div/div/p/input').click
		#subscription breakdown - check total £80.40
		subs_check = driver.find_element(xpath: '/html/body/section[2]/div[1]/div/div[2]/table[3]/tbody/tr[3]/td')
    	total_cost = subs_check.attribute("innerHTML")
    	s = total_cost.to_s
    	puts s	
		driver.find_element(id: 'open-stripe-card-details-modal').click
		#stripe modal
		driver.find_element(id: 'account_payment_contact_name').sendkeys "AdminBuyNow"
		driver.find_element(id: 'account_payment_contact_email').sendkeys ("admin" + random_number_string + "@regressionaccount.com")
		driver.find_element(id: 'account_payment_contact_phone').sendkeys "123"
		driver.switchto().frame(driver.find_element(css: '#card-element iframe'))
		driver.find_element(name: 'cardnumber').sendkeys "4242424242424242"
		driver.find_element(name: 'exp-date').sendkeys "0927"
		driver.find_element(name: 'cvc').sendkeys "123"
		driver.switchto().defaultcontent
		driver.find_element(id: 'card-button').click
		sleep 1
		driver.find_element(id: '/html/body/section[2]/div[1]/div/a').click
	end

		#driver.find_element(id: '').click
		#driver.find_element(id: '').sendkeys ""
end