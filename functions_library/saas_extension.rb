require File.expand_path('../base.rb', __FILE__)

class SaasExtension < Base

	def delete_account_from_direct_search_account_page
		driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').send_keys "Regression Account1"
		driver.find_element(class: 'svg-inline--fa fa-trash-alt fa-w-14 action-icon pointer action-danger delete-icon').click
		sleep 0.5
		driver.find_element(class: 'btn btn-danger modal-confirm').click
	end
end
