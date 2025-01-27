# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class SicknessTriggersExtension < Base
	def navigate_to_bradford_factor # Navigates to bradford factor from settings view
  		driver.find_element(css:'body > div.hr-main-container > div > section > div:nth-child(2) > div:nth-child(2) > div:nth-child(1) > a:nth-child(7)').click
  		driver.find_element(css: 'body > div.hr-main-container > div > section > div.row > div > div > a:nth-child(2)').click
  	end

  	def open_bradford_factor_create_modal # Opens /bradford_factor_rules_new
  		driver.find_element(css: 'body > div.hr-main-container > div > section > div.float-right > a > span > svg.svg-inline--fa.fa-plus.fa-w-14.fa-inverse.fa-stack-1x').click
  	end

  	def create_bradford_factor_rule # Creates bradford with a limit of 120
  		driver.find_element(id: 'bradford_factor_rule_score').clear
  		driver.find_element(id: 'bradford_factor_rule_score').send_keys("120.0")
  		driver.find_element(css: '#new_bradford_factor_rule > p > input').click
  	end

  	def cancel_bradford_factor # Opens the create modal then exits without saving by clicking cancel
  	  	driver.find_element(class: "btn-outline-secondary").click
  	end

  	def compare_bradford_result	# Compares the bradford value in the overview table with the inputted 120 value
  		bradford_amount = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.sorting_1').text
		if bradford_amount == '120.0'
			puts "PASS - Amount Correct"
		else 
			puts "FAIL - Amount incorrect"
		end
	end

	def compare_edited_bradford_result	# Compares the bradford value in the overview table with the inputted 120 value
  		bradford_amount = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.sorting_1').text
		if bradford_amount == '150.0'
			puts "PASS - Amount Correct"
		else 
			puts "FAIL - Amount incorrect"
		end
	end

	def open_bradford_factor_edit_modal
		driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(1) > svg').click
	end

	def edit_bradford_factor_rule # Changes value to 150
		driver.find_element(css: '#bradford_factor_rule_score').clear
		driver.find_element(css: '#bradford_factor_rule_score').send_keys '150.0'
  		driver.find_element(class: "btn-success").click
	end

	def cancel_bradford_factor_edit # Opens the edit modal and cancels the changes'
		driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(1) > svg').click
		driver.find_element(class: "btn-outline-secondary").click

	end

	def open_bradford_factor_delete_modal # Opens the confirm delete alert window
		driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > svg').click
	end

	def confirm_bradford_factor_delete # Clicks 'Yes, delete' in deletion alert window
		driver.find_element(class: "modal-confirm").click
	end

	def cancel_bradford_factor_delete # Clicks 'No' in deletion alert window
		driver.find_element(class: "btn-secondary").click
	end
end