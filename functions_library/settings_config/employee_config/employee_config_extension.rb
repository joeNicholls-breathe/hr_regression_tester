# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class EmployeeConfigExtension < Base
  def employee_congifuration_what_can_see_remunerations
    driver.find_element(id: 'account_employees_see_remuneration').click
  end

  def employee_congifuration_what_can_see_performance_metrics
    driver.find_element(id: 'account_performance_metrics').click
  end

  def employee_congifuration_what_can_see_custom_fields
    driver.find_element(id: 'account_employees_see_custom_fields').click
  end

  def employee_congifuration_what_can_see_directory
    driver.find_element(id: 'employees-directory-checkbox').click
  end

  def employee_congifuration_what_can_see_calendar
    driver.find_element(id: 'account_employees_can_see_calendar').click
  end

  def employee_congifuration_what_can_see_kudus_leaderboard
    driver.find_element(id: 'account_employees_can_view_kudos_leaderboard').click
  end

  def employee_congifuration_what_can_see_location_booking_report
    driver.find_element(id: 'account_employees_can_view_location_bookings_report').click
  end

  def employee_congifuration_what_can_do_update_profile_picture
    driver.find_element(id: 'account_employees_can_change_avatar').click
  end

  def employee_congifuration_what_can_do_request_toil
    driver.find_element(id: 'account_employees_see_toil').click
  end

  def employee_congifuration_what_can_do_report_sickness
    driver.find_element(id: 'account_employees_can_report_sickness').click
  end

  def employee_congifuration_what_can_do_request_one_to_ones
    driver.find_element(id: 'account_employees_can_request_one_to_ones').click
  end

  def employee_congifuration_what_can_do_enter_training_record
    driver.find_element(id: 'account_employees_can_enter_training').click
  end

  def employee_congifuration_what_can_do_booking_locations
    driver.find_element(id: 'account_employees_can_book_locations').click
  end

  def employee_congifuration_update
    driver.find_element(css: '#edit_account_3899 > p > input').click
  end

  def employee_congifuration_cancel
    driver.find_element(css: 'href="/account/settings"').click
  end
end
