# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/sickness_triggers_extension'

# rubocop:disable Metrics/AbcSize
class BradfordFactorTriggers
  attr_accessor :driver

  # Tests the create, edit, delete functions for bradford factor triggers

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def execute
    test1012a_create_bradford_trigger
    test1012b_cancel_create_bradford_trigger
    test1012c_edit_bradford_trigger
    test1012d_cancel_bradford_factor_edit
    test1012e_cancel_bradford_factor_delete
    test1012f_delete_bradford_trigger
    puts 'All Tests Completed'
  end

  def navigate_to_bradford_factor
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'PASS - load landing page'
    LoginExtension.new(driver).login_setup_acc_admin
    puts 'PASS - login as admin'
    LoginAppExtension.new(driver).select_hr
    puts 'PASS - select hr'
    AppNavigationExtensionManager.new(driver).navigate_to_settings_with_welcome_page_active
    BradfordFactorExtension.new(driver).navigate_to_bradford_factor
    puts 'PASS - Navigate to Bradford Sickness Triggers'
  end

  def test1012a_create_bradford_trigger
    puts 'Starting test_1001'
    navigate_to_bradford_factor
    GeneralSicknessTriggerExtension.new(driver).open_new_rule_modal
    puts 'PASS - Create modal open'
    BradfordFactorExtension.new(driver).create_bradford_factor_rule
    puts 'PASS - Created bradford factor'
    BradfordFactorExtension.new(driver).compare_bradford_result
  end

  def test1012b_cancel_create_bradford_trigger
    puts 'Starting test_1002'
    navigate_to_bradford_factor
    GeneralSicknessTriggerExtension.new(driver).open_new_rule_modal
    puts 'PASS - Create modal open'
    GeneralSicknessTriggerExtension.new(driver).cancel_rule_creation
    puts 'PASS - Bradford Rule Cancelled'
  end

  def test1012d_edit_bradford_trigger
    puts 'Starting test_2001'
    navigate_to_bradford_factor
    BradfordFactorExtension.new(driver).open_bradford_factor_edit_modal
    puts 'PASS - Edit modal open'
    BradfordFactorExtension.new(driver).edit_bradford_factor_rule
    puts 'PASS - Rule Edited'
    BradfordFactorExtension.new(driver).compare_edited_bradford_result
  end

  def test1012e_cancel_bradford_factor_edit
    puts 'Starting test_2002'
    navigate_to_bradford_factor
    BradfordFactorExtension.new(driver).open_bradford_factor_edit_modal
    puts 'PASS - Edit modal open'
    GeneralSicknessTriggerExtension.new(driver).cancel_rule_creations
    puts 'PASS - Bradford Rule Cancelled'
  end

  def test1012f_cancel_bradford_factor_delete
    puts 'Starting test_3002'
    navigate_to_bradford_factor
    BradfordFactorExtension.new(driver).open_bradford_factor_delete_modal
    puts 'PASS - Confirm Delete window opened'
    GeneralSicknessTriggerExtension.new(driver).cancel_rule_deletion
  end

  def test1012g_delete_bradford_trigger
    puts 'Starting test_3002'
    navigate_to_bradford_factor
    BradfordFactorExtension.new(driver).open_bradford_factor_delete_modal
    puts 'PASS - Confirm Delete window opened'
    GeneralSicknessTriggerExtension.new(driver).confirm_rule_deletion
    puts 'PASS - Bradford Rule Deleted'
  end
end
# rubocop:enable Metrics/AbcSize

BradfordFactorTriggers.new.execute
