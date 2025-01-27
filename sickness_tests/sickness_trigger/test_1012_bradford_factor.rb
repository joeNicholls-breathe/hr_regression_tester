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
    test101_create_bradford_trigger
    test102_cancel_create_bradford_trigger
    test103_edit_bradford_trigger
    test104_cancel_bradford_factor_edit
    test105_cancel_bradford_factor_delete
    test106_delete_bradford_trigger
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
    SicknessTriggersExtension.new(driver).navigate_to_bradford_factor
    puts 'PASS - Navigate to Bradford Sickness Triggers'
  end

  def test101_create_bradford_trigger
    puts 'Starting test_1001'
    navigate_to_bradford_factor
    SicknessTriggersExtension.new(driver).open_bradford_factor_create_modal
    puts 'PASS - Create modal open'
    SicknessTriggersExtension.new(driver).create_bradford_factor_rule
    puts 'PASS - Created bradford factor'
    SicknessTriggersExtension.new(driver).compare_bradford_result
  end

  def test102_cancel_create_bradford_trigger
    puts 'Starting test_1002'
    navigate_to_bradford_factor
    SicknessTriggersExtension.new(driver).open_bradford_factor_create_modal
    puts 'PASS - Create modal open'
    SicknessTriggersExtension.new(driver).cancel_bradford_factor
    puts 'PASS - Bradford Rule Cancelled'
  end

  def test103_edit_bradford_trigger
    puts 'Starting test_2001'
    navigate_to_bradford_factor
    SicknessTriggersExtension.new(driver).open_bradford_factor_edit_modal
    puts 'PASS - Edit modal open'
    SicknessTriggersExtension.new(driver).edit_bradford_factor_rule
    puts 'PASS - Rule Edited'
    SicknessTriggersExtension.new(driver).compare_edited_bradford_result
  end

  def test104_cancel_bradford_factor_edit
    puts 'Starting test_2002'
    navigate_to_bradford_factor
    SicknessTriggersExtension.new(driver).open_bradford_factor_edit_modal
    puts 'PASS - Edit modal open'
    SicknessTriggersExtension.new(driver).cancel_bradford_factor
    puts 'PASS - Bradford Rule Cancelled'
  end

  def test105_cancel_bradford_factor_delete
    puts 'Starting test_3002'
    navigate_to_bradford_factor
    SicknessTriggersExtension.new(driver).open_bradford_factor_delete_modal
    puts 'PASS - Confirm Delete window opened'
  end

  def test106_delete_bradford_trigger
    puts 'Starting test_3002'
    navigate_to_bradford_factor
    SicknessTriggersExtension.new(driver).open_bradford_factor_delete_modal
    puts 'PASS - Confirm Delete window opened'
    SicknessTriggersExtension.new(driver).confirm_bradford_factor_delete
    puts 'PASS - Bradford Rule Deleted'
  end
end
# rubocop:enable Metrics/AbcSize

BradfordFactorTriggers.new.execute
