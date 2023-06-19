require File.expand_path('../base.rb', __FILE__)

class CompanyHolidaysExtension < Base 
	def company_holiday_add
		driver.find_element(xpath: '/html/body/section[2]/div[2]/a/span/svg[1]').click
		driver.find_element(id: 'company_holiday_name').send_keys "Test Holiday" + todays_date
		driver.find_element(id: '#company_holiday_day_on_react').send_keys todays_date
		driver.find_element(id: 'company_holiday_half').click
		driver.find_element(xpath: '//*[@id="new_company_holiday"]/p/input').click
	end

	def company_holiday_edit
		driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr/td[3]/a[1]/svg/path').click
		driver.find_element(id: 'company_holiday_name').send_keys "Test Holiday" + tomorrow
		driver.find_element(id: '#company_holiday_day_on_react').send_keys tomorrow
		driver.find_element(xpath: '//*[@id="new_company_holiday"]/p/input').click
		#no half day
	end

	def company_holiday_delete
		driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr/td[3]/svg/path').click
		driver.find_element(xpath: '//*[@id="delete_company_holiday"]/div/div/div[3]/button[2]').click
	end
end
