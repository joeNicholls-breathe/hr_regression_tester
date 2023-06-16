require File.expand_path('../base.rb', __FILE__)

class CompanyBlackoutsExtension < Base
	def company_blakout_add_new
		driver.find_element(xpath: '/html/body/section[2]/div[2]/a').click
		driver.find_element(id: 'company_blackout_name').sendkeys "Balckout test" + todays_date)
		driver.find_element(id: '#company_blackout_start_date_react').sendkeys todays_date + 14
		driver.find_element(id: '#company_blackout_end_date_react').sendkeys todays_date + 14
		driver.find_element(id: 'company_blackout_whole_company').click		
		driver.find_element(xpath: '//*[@id="new_company_blackout"]/p/input').click
		driver.find_element(xpath: '/html/body/section[2]/div[1]/a').click
	end

	def company_blackout_delete
		driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr/td[6]/svg/path').click
		driver.find_element(xpath: '//*[@id="delete_company_blackout"]/div/div/div[3]/button[2]').click
	end
end
