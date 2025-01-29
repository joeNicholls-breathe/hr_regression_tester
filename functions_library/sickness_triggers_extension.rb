# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class GeneralSicknessTriggerExtension < Base
  # Opens /bradford_factor_rules_new
  def open_new_rule_modal
    driver.find_element(
      css: 'body > div.hr-main-container > div > section > div.float-right > a > span >
       svg.svg-inline--fa.fa-plus.fa-w-14.fa-inverse.fa-stack-1x'
    ).click
  end

  # Cancels the creation of a rule
  def cancel_rule_creation
    driver.find_element(class: 'btn-outline-secondary').click
  end

  def confirm_rule_deletion
    driver.find_element(class: 'modal-confirm').click
  end

  # Clicks 'No' in deletion alert window
  def cancel_rule_deletion
    driver.find_element(class: 'btn-secondary').click
  end

  # For validation that appears as a notification banner, extracts the text and checks it against expected.
  def find_notification_validation_message(expected_validation)
    actual_validation = driver.find_element(css: 'body > div.notification').text
    if actual_validation == expected_validation
      puts 'PASS - Validation As Expected'
    else
      puts 'FAIL - Validation Does Not Match Expected'
      puts "Expected #{expected_validation} but got #{actual_validation}"
    end
  end
end

class BradfordFactorExtension < Base
  # Navigates to bradford factor from settings view
  def navigate_to_bradford_factor
    driver.find_element(
      css: 'body > div.hr-main-container > div > section > div:nth-child(2) > div:nth-child(2) > div:nth-child(1)
      > a:nth-child(7)'
    ).click
    driver.find_element(
      css: 'body > div.hr-main-container > div > section > div.row > div > div > a:nth-child(2)'
    ).click
  end

  # Creates bradford with a limit of 120
  def create_bradford_factor_rule
    driver.find_element(id: 'bradford_factor_rule_score').clear
    driver.find_element(id: 'bradford_factor_rule_score').send_keys('120.0')
    driver.find_element(class: 'btn-success').click
  end

  # Opens the create modal then exits without saving by clicking cancel
  def cancel_bradford_factor
    driver.find_element(class: 'btn-outline-secondary').click
  end

  # Compares the bradford value in the overview table with the inputted 120 value
  def compare_bradford_result
    bradford_amount = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.sorting_1').text
    if bradford_amount == '120.0'
      puts 'PASS - Amount Correct'
    else
      puts 'FAIL - Amount incorrect'
    end
  end

  # Compares the bradford value in the overview table with the inputted 120 value
  def compare_edited_bradford_result
    bradford_amount = driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.sorting_1').text
    if bradford_amount == '150.0'
      puts 'PASS - Amount Correct'
    else
      puts 'FAIL - Amount incorrect'
    end
  end

  def open_bradford_factor_edit_modal
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(1) > svg').click
  end

  # Changes value to 150
  def edit_bradford_factor_rule
    driver.find_element(css: '#bradford_factor_rule_score').clear
    driver.find_element(css: '#bradford_factor_rule_score').send_keys '150.0'
    driver.find_element(class: 'btn-success').click
  end

  # Opens the edit modal and cancels the changes'
  def cancel_bradford_factor_edit
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > a:nth-child(1) > svg').click
    driver.find_element(class: 'btn-outline-secondary').click
  end

  # Opens the confirm delete alert window
  def open_bradford_factor_delete_modal
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions > svg').click
  end

  # Check the 'validationMessage' attribute of the input field when an input fails
  def find_bradford_validation_message(expected_validation)
    validation_message = driver.find_element(id: 'bradford_factor_rule_score')
    actual_validation = validation_message.attribute('validationMessage')
    if actual_validation == expected_validation
      puts 'PASS - Validation As Expected'
    else
      puts 'FAIL - Validation Does Not Match Expected'
      puts "Expected #{expected_validation} but got #{actual_validation}"
    end
  end

  # Attempts to create factor without any value
  def create_empty_bradford_factor
    driver.find_element(id: 'bradford_factor_rule_score').clear
    puts 'Input field cleared'
    driver.find_element(class: 'btn-success').click
  end

  # Attempt to create a factor of -1
  def create_bradford_factor_below_zero
    driver.find_element(id: 'bradford_factor_rule_score').clear
    driver.find_element(id: 'bradford_factor_rule_score').send_keys '-1'
    driver.find_element(class: 'btn-success').click
  end

  # Attempt to create a factor of e
  def create_non_numerical_bradford_factor
    driver.find_element(id: 'bradford_factor_rule_score').clear
    driver.find_element(id: 'bradford_factor_rule_score').send_keys('e')
    driver.find_element(class: 'btn-success').click
  end

  # Attempt to create a factor of 0.75
  def create_bradford_between_two_valid_values
    driver.find_element(id: 'bradford_factor_rule_score').clear
    driver.find_element(id: 'bradford_factor_rule_score').send_keys '0.75'
    driver.find_element(class: 'btn-success').click
  end

  # Clicks the Bradford Factor breadcrumb to take you from the /new view to the overview
  def click_breadcrumb_between_create_and_overview
    driver.find_element(
      css: 'body > div.hr-main-container > div > section > div:nth-child(1) > div > div > a > svg'
    ).click
  end
end

class SicknessInstanceExtension < Base
  # Navigates to Sickness Instances From settings view
  def navigate_to_sickness_instances
    driver.find_element(
      css: 'body > div.hr-main-container > div > section > div:nth-child(2) > div:nth-child(2) > div:nth-child(1)
      > a:nth-child(7)'
    ).click
    driver.find_element(
      css: 'body > div.hr-main-container > div > section > div.row > div > div > a:nth-child(4)'
    ).click
  end

  # Creates a rule with 5 instances in 6 months
  def create_sickness_instance
    driver.find_element(id: 'sickness_rule_number_of_instances').send_keys('5')
    number_of_months_dropdown = driver.find_element(id: 'sickness_rule_number_of_months')
    select = Selenium::WebDriver::Support::Select.new(number_of_months_dropdown)
    select.select_by(:index, 5)
    driver.find_element(class: 'btn-success').click
  end

  # Compares the sickness instance value in the overview table with the inputted values
  def compare_number_of_instances
    number_of_instances = driver.find_element(
      css: 'body > div.hr-main-container > div > section > table > tbody > tr > td:nth-child(1)'
    ).text
    if number_of_instances == '5'
      puts 'PASS - Number of Instances Correct'
    else
      puts 'FAIL - Number of Instances incorrect'
    end
  end

  def compare_number_of_months
    number_of_months = driver.find_element(
      css: 'body > div.hr-main-container > div > section > table > tbody > tr > td:nth-child(2)'
    ).text
    if number_of_months == '6'
      puts 'PASS - Number of Months Correct'
    else
      puts 'FAIL - Nmber of Months incorrect'
    end
  end

  def open_sickness_instance_edit_modal
    driver.find_element(
      css: 'body > div.hr-main-container > div > section > table > tbody > tr > td.actions > a:nth-child(1) > svg'
    ).click
  end

  def edit_sickness_instance_rule
    driver.find_element(id: 'sickness_rule_number_of_instances').clear
    driver.find_element(id: 'sickness_rule_number_of_instances').send_keys '1'
    driver.find_element(class: 'btn-success').click
  end

  def compare_edited_number_of_instances
    number_of_instances = driver.find_element(
      css: 'body > div.hr-main-container > div > section > table > tbody > tr > td:nth-child(1)'
    ).text
    if number_of_instances == '1'
      puts 'PASS - Number of Instances Correct'
    else
      puts 'FAIL - Number of Instances Incorrect'
    end
  end

  def open_sickness_instance_delete_modal
    driver.find_element(
      css: 'body > div.hr-main-container > div > section > table > tbody > tr > td.actions > svg'
    ).click
  end

  def find_instances_validation_message(expected_validation)
    validation_message = driver.find_element(css: '#sickness_rule_number_of_instances')
    actual_validation = validation_message.attribute('validationMessage')
    if actual_validation == expected_validation
      puts 'PASS - Validation As Expected'
    else
      puts 'FAIL - Validation Does Not Match Expected'
      puts "Expected #{expected_validation} but got #{actual_validation}"
    end
  end

  def create_non_numeric_sickness_instance
    driver.find_element(css: '#sickness_rule_number_of_instances').send_keys 'e'
    driver.find_element(class: 'btn-success').click
  end

  def create_non_integer_sickness_instance
    driver.find_element(css: '#sickness_rule_number_of_instances').send_keys '1.5'
    driver.find_element(class: 'btn-success').click
  end
end
