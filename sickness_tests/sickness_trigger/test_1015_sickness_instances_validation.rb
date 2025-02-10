# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/sickness_triggers_extension'

# rubocop:disable Metrics/AbcSize
class SicknessInstanceValidation
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def execute
    test_1015a_cannot_be_empty
    test_1015b_must_be_a_number
    test_1015c_must_be_an_integer
    test_1015d_create_duplicate_rule
  end

  def open_sickness_instances # rubocop:disable Metrics/AbcSize
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'PASS - load landing page'
    LoginExtension.new(driver).login_setup_acc_admin
    puts 'PASS - login as admin'
    LoginAppExtension.new(driver).select_hr
    puts 'PASS - select hr'
    AppNavigationExtensionManager.new(driver).navigate_to_settings_with_welcome_page_active
    SicknessInstanceExtension.new(driver).navigate_to_sickness_instances
  end

  # Attempts to create a rule without a number of sicknesses
  def test_1015a_cannot_be_empty
    open_sickness_instances
    GeneralSicknessTriggerExtension.new(driver).open_new_rule_modal
    puts 'PASS - Create modal open'
    driver.find_element(class: 'btn-success').click
    SicknessInstanceExtension.new(driver).find_instances_validation_message(
      'Please fill in this field.'
    )
  end

  # Attempts to create a rule with a number of sicknesses of e
  def test_1015b_must_be_a_number
    open_sickness_instances
    GeneralSicknessTriggerExtension.new(driver).open_new_rule_modal
    puts 'PASS - Create modal open'
    SicknessInstanceExtension.new(driver).create_non_numeric_sickness_instance
    SicknessInstanceExtension.new(driver).find_instances_validation_message(
      'Please enter a number.'
    )
  end

  # Attempts to create a rule with a number of sicknesses of 1.5
  def test_1015c_must_be_an_integer
    open_sickness_instances
    GeneralSicknessTriggerExtension.new(driver).open_new_rule_modal
    puts 'PASS - Create modal open'
    SicknessInstanceExtension.new(driver).create_non_integer_sickness_instance
    SicknessInstanceExtension.new(driver).find_instances_validation_message(
      'Please enter a valid value. The two nearest valid values are 1 and 2.'
    )
  end

  # Attempts to create the same rule twice
  def test_1015d_create_duplicate_rule # rubocop:disable Metrics/MethodLength
    open_sickness_instances
    2.times do
      GeneralSicknessTriggerExtension.new(driver).open_new_rule_modal
      SicknessInstanceExtension.new(driver).create_sickness_instance
    end
    GeneralSicknessTriggerExtension.new(driver).find_notification_validation_message(
      'Error creating a sickness rule A rule for 5 instances within 6 months already exists'
    )
    BradfordFactorExtension.new(driver).click_breadcrumb_between_create_and_overview
    SicknessInstanceExtension.new(driver).open_sickness_instance_delete_modal
    GeneralSicknessTriggerExtension.new(driver).confirm_rule_deletion
  end
end
# rubocop:enable Metrics/AbcSize
SicknessInstanceValidation.new.execute
