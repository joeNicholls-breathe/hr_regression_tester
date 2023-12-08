# frozen_string_literal: true

require 'selenium-webdriver'
require 'logger'
require './functions_library/ui_page_element_check'
require './functions_library/test_reference_extension'
require './functions_library/navigate_browser_extension'
require './functions_library/login_extension'
require './functions_library/login_app_extension'
require './functions_library/navigate_around_app_manager'

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize
class LMUserViewAccess < Base
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    Selenium::WebDriver.logger.level = :info
  end

  def test_line_view_manage_permisssions
    NavigateBrowserExtension.new(driver).breathe_login
    puts '1. navigate to breathe login url'
    LoginExtension.new(driver).login_setup_acc_line_manager
    LoginAppExtension.new(driver).select_hr
    puts '2. login'
    AppNavigationExtensionLM.new(driver).lm_dashboard
    puts 'navigate to a member of the team that the lm manages'
    AppNavigationExtensionLM.new(driver).my_people
    AppNavigationExtensionLM.new(driver).my_employee
    AppNavigationExtensionLM.new(driver).my_employee_leave
    puts 'view the employees leave record'
    puts 'add new leave request'
    puts 'try to approve'
    puts 'try to cancel booked leave'
    puts 'try to delete request'
    puts 'try to add toil or make an adjustment'
    puts 'review the employees sickness record'
    puts 'try to approve'
    puts 'try to delete'
    puts 'view any training requests'
    puts 'try to approve'
    puts 'try to delete'
    puts 'view 121 meetings'
    puts 'view objectives'
    puts 'view deliverables'
    puts 'view employees job details'
    puts 'view employees remunerations package (salary/additional payments/benefits/bank details)'
    puts 'view emergency contact info'
    puts 'view medical facts'
    puts 'view personal history'
    puts 'view any notes made on the employee'
    puts 'view equipment currently provided to the employee'
    puts 'view id documentation'
    puts 'view dbs checks'
    puts 'view grievenced and disaplinaries'
    puts 'view time logs'
    puts 'can the lm view the peoples poeple profile? (Salary/Contact details/DBS check)'
    puts 'Test 1006c complete'
    driver.close
  end
end
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
LMUserViewAccess.new.test_line_view_manage_permisssions
