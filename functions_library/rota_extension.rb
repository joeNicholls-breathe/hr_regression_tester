# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

# rubocop:disable Metrics/ClassLength # :
class RotaExtension < Base
	def assign_shift
		driver.find_element(css: settings[:staging][:rota_assign_shift_to_admin_user]).click
		driver.find_element(css: 'input[id=roster-time-range-input]').send_keys '9-17'
		driver.find_element(css: '.input-with-icon__icon-wrapper > svg:nth-child(1)').click
    end

	def share_shift
		binding.pry
		driver.find_element(css: 'button[id=share-roster]').displayed? #viewable
		driver.find_element(:id,'Element').text #get text

		driver.find_element(css: 'button[id=share-roster]').click
		driver.find_element(css: 'button[id=publish-changes-btn]').click
	end

	def delete_shift
		driver.find_element()
	end

	def create_template
		driver.find_element()
	end

	def assign_template
		driver.find_element()
	end

	def add_timesheet_pending_approval
		driver.find_element()
	end

	def approve_timesheet
		driver.find_element()
	end

	def reject_timesheet
		driver.find_element()
	end
	
	def remove_timesheet
		driver.find_element()
	end

	def view_notifications_employee_shifts
		driver.find_element()
	end
end
# rubocop:enable Metrics/ClassLength # :
