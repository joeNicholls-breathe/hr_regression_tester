# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class SicknessTriggersExtension < Base
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

  # Opens /bradford_factor_rules_new
  def open_bradford_factor_create_modal
    driver.find_element(
      css: 'body > div.hr-main-container > div > section > div.float-right > a > span >
       svg.svg-inline--fa.fa-plus.fa-w-14.fa-inverse.fa-stack-1x'
    ).click
  end

  # Creates bradford with a limit of 120
  def create_bradford_factor_rule
    driver.find_element(id: 'bradford_factor_rule_score').clear
    driver.find_element(id: 'bradford_factor_rule_score').send_keys('120.0')
    driver.find_element(css: '#new_bradford_factor_rule > p > input').click
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

  # Clicks 'Yes, delete' in deletion alert window
  def confirm_bradford_factor_delete
    driver.find_element(class: 'modal-confirm').click
  end

  # Clicks 'No' in deletion alert window
  def cancel_bradford_factor_delete
    driver.find_element(class: 'btn-secondary').click
  end
end
