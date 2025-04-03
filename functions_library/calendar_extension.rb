# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class CalendarExtension < Base
  def find_training_request(training_id)
    calendar_training = "EmployeeTrainingCourse_#{training_id}"
    driver.find_element(id: calendar_training)
  end

  def verify_training_not_present(element)
    driver.find_element(id: element)
    puts 'FAIL - Training still exists'
    false
  rescue Selenium::WebDriver::Error::NoSuchElementError
    puts 'PASS - Training Removed from calendar'
    true
  end

  def click_sickness_radio_filter
    driver.find_element(id: 'show-sicknesses').click
  end

  def click_holiday_radio_filter
    driver.find_element(id: 'show-holidays').click
  end

  def click_leave_request_radio_filter
    driver.find_element(id: 'show-leave-requests').click
  end

  def click_other_leave_radio_filter
    driver.find_element(id: 'show-other-leave').click
  end

  def click_one_to_ones_radio_filter
    driver.find_element(id: 'show-one-to-ones').click
  end

  def click_show_training_radio_filter
    driver.find_element(id: 'show-training').click
  end

  def filter_only_training
    click_sickness_radio_filter
    click_holiday_radio_filter
    click_leave_request_radio_filter
    click_other_leave_radio_filter
    click_one_to_ones_radio_filter
  end

  def find_employee_on_calendar(employee_name)
    tspan = driver.find_elements(tag_name: 'tspan')
    emp = tspan.select do |x|
      x.text == employee_name
    end
    if emp[0].text == employee_name
      puts 'PASS - Employee Found'
    else
      puts 'FAIL - Employee Not found'
    end
  end
end
