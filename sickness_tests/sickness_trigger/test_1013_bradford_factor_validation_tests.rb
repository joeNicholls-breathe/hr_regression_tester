# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/sickness_triggers_extension'

# rubocop:disable Metrics/AbcSize

class BradfordFactorValidation
  attr_accessor :driver

  # Tests the create, edit, delete functions for bradford factor triggers

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def execute
    test_1013a_empty_value
    test_1013b_below_zero
    test_1013c_non_numerical_value
    test_1013d_factor_between_two_valid_values
    test_1013e_creating_duplicate_rule
    test_1013f_factor_over_maximum_boundary
  end

  def navigate_to_bradford_factor
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'PASS - load landing page'
    LoginExtension.new(driver).login_setup_acc_admin
    puts 'PASS - login as admin'
    LoginAppExtension.new(driver).select_hr
    puts 'PASS - select hr'
    AppNavigationExtensionManager.new(driver).navigate_to_settings_with_welcome_page_active
    sleep 2
    BradfordFactorExtension.new(driver).navigate_to_bradford_factor
    puts 'PASS - Navigate to Bradford Sickness Triggers'
  end

  # Attempts to create a rule with no entered value
  def test_1013a_empty_value
    navigate_to_bradford_factor
    GeneralSicknessTriggerExtension.new(driver).open_new_rule_modal
    puts 'PASS - Create modal open'
    BradfordFactorExtension.new(driver).create_empty_bradford_factor
    BradfordFactorExtension.new(driver).find_bradford_validation_message(
      'Please fill in this field.'
    )
  end

  # Attempts to create a rule with factor of -1
  def test_1013b_below_zero
    navigate_to_bradford_factor
    GeneralSicknessTriggerExtension.new(driver).open_new_rule_modal
    puts 'PASS - Create modal open'
    BradfordFactorExtension.new(driver).create_bradford_factor_below_zero
    puts 'Creating Empty Bradford Factor'
    BradfordFactorExtension.new(driver).find_bradford_validation_message(
      'Value must be greater than or equal to 0.5.'
    )
  end

  # Attempts to create a rule with a factor of e
  def test_1013c_non_numerical_value
    navigate_to_bradford_factor
    GeneralSicknessTriggerExtension.new(driver).open_new_rule_modal
    puts 'PASS - Create modal open'
    BradfordFactorExtension.new(driver).create_non_numerical_bradford_factor
    BradfordFactorExtension.new(driver).find_bradford_validation_message(
      'Please enter a number.'
    )
  end

  # Attempts to create a rule with a factor of 0.75
  def test_1013d_factor_between_two_valid_values
    navigate_to_bradford_factor
    GeneralSicknessTriggerExtension.new(driver).open_new_rule_modal
    puts 'PASS - Create modal open'
    BradfordFactorExtension.new(driver).create_bradford_between_two_valid_values
    BradfordFactorExtension.new(driver).find_bradford_validation_message(
      'Please enter a valid value. The two nearest valid values are 0.5 and 1.'
    )
  end

  # Attempts to create the same rule twice - Currently B
  def test_1013e_creating_duplicate_rule # rubocop:disable Metrics/MethodLength
    navigate_to_bradford_factor
    2.times do
      GeneralSicknessTriggerExtension.new(driver).open_new_rule_modal
      puts 'PASS - Create modal open'
      BradfordFactorExtension.new(driver).create_bradford_factor_rule
    end
    GeneralSicknessTriggerExtension.new(driver).find_notification_validation_message(
      'Error creating rule A rule with 120.0 already exists.'
    )
    # Removes the created rule so the test is re-runnable not part of validation criteria
    BradfordFactorExtension.new(driver).click_breadcrumb_between_create_and_overview
    BradfordFactorExtension.new(driver).open_bradford_factor_delete_modal
    GeneralSicknessTriggerExtension.new(driver).confirm_rule_deletion
  end

  # Attempts to create a rule with a factor of 1001
  def test_1013f_factor_over_maximum_boundary
    navigate_to_bradford_factor
    GeneralSicknessTriggerExtension.new(driver).open_new_rule_modal
    puts 'PASS - Create modal open'
    BradfordFactorExtension.new(driver).create_bradford_over_one_thousand
    GeneralSicknessTriggerExtension.new(driver).find_notification_validation_message(
      'Error creating rule Score must be less than 1000'
    )
  end
end

BradfordFactorValidation.new.execute
# rubocop:enable Metrics/AbcSize\
