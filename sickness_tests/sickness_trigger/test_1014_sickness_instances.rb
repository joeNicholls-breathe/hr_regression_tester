# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_manager_extension'
require './functions_library/sickness_triggers_extension'

# rubocop:disable Metrics/AbcSize\

class SicknessInstanceTriggers
  attr_accessor :driver

  # Tests the create, edit, delete functions for sickness instance triggers

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def execute
    test1014a_create_sickness_instance
    test1014b_cancel_create_sickness_instance
    test1014c_edit_sickness_instance
    test1014d_cancel_edit_sickness_instance
    test1014e_cancel_delete_sickness_instance
    test1014f_delete_sickness_instance
  end

  def open_sickness_instances
    NavigateBrowserExtension.new(driver).breathe_login
    puts 'PASS - load landing page'
    LoginExtension.new(driver).login_setup_acc_admin
    puts 'PASS - login as admin'
    LoginAppExtension.new(driver).select_hr
    puts 'PASS - select hr'
    AppNavigationExtensionManager.new(driver).navigate_to_settings_with_welcome_page_active
    sleep 2
    SicknessInstanceExtension.new(driver).navigate_to_sickness_instances
  end

  def test1014a_create_sickness_instance
    open_sickness_instances
    GeneralSicknessTriggerExtension.new(driver).open_new_rule_modal
    puts 'PASS - Sickness Instance Window Opened'
    SicknessInstanceExtension.new(driver).create_sickness_instance
    puts 'PASS - Rule Created'
    SicknessInstanceExtension.new(driver).compare_number_of_instances
    SicknessInstanceExtension.new(driver).compare_number_of_months
    puts 'test1014a Complete'
  end

  def test1014b_cancel_create_sickness_instance
    open_sickness_instances
    GeneralSicknessTriggerExtension.new(driver).open_new_rule_modal
    puts 'PASS - Sickness Instance Window Opened'
    GeneralSicknessTriggerExtension.new(driver).cancel_rule_creation
    puts 'PASS - Sickness Instance Cancelled'
    puts 'test1014b Complete'
  end

  def test1014c_edit_sickness_instance
    open_sickness_instances
    SicknessInstanceExtension.new(driver).open_sickness_instance_edit_modal
    puts 'PASS - Edit window opened'
    SicknessInstanceExtension.new(driver).edit_sickness_instance_rule
    puts 'PASS - Rule Edited'
    puts 'test1014c Complete'
  end

  def test1014d_cancel_edit_sickness_instance
    open_sickness_instances
    SicknessInstanceExtension.new(driver).open_sickness_instance_edit_modal
    puts 'PASS - Edit window opened'
    GeneralSicknessTriggerExtension.new(driver).cancel_rule_creation
    puts 'PASS - Edit cancelled'
    puts 'test1014d Complete'
  end

  def test1014e_cancel_delete_sickness_instance
    open_sickness_instances
    SicknessInstanceExtension.new(driver).open_sickness_instance_delete_modal
    puts 'PASS - Confirm Delete Window Opened '
    GeneralSicknessTriggerExtension.new(driver).cancel_rule_deletion
    puts 'PASS - Delete Window Closed'
    puts 'test1014e Complete'
  end

  def test1014f_delete_sickness_instance
    open_sickness_instances
    SicknessInstanceExtension.new(driver).open_sickness_instance_delete_modal
    puts 'PASS - Confirm Delete Window Opened '
    GeneralSicknessTriggerExtension.new(driver).confirm_rule_deletion
    puts 'PASS - Sickness Instance Deleted'
    puts 'test1014f Complete'
  end
end

SicknessInstanceTriggers.new.execute
# rubocop:enable Metrics/AbcSize\
