require 'selenium-webdriver'
require './functions_library/navigate_browser_extension.rb'
require './functions_library/login_extension.rb'
require './functions_library/logout_extension.rb'
require './functions_library/login_app_extension.rb'
require './functions_library/employee_dashboard_extension.rb'
require './functions_library/holiday_extension.rb'
require './functions_library/navigate_around_app_employee.rb'


class TestLeaveRequest
  attr_accessor :driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    # driver.manage.timeout.implicit_wait = 3
    Selenium::WebDriver.logger.level = :info
  end

  def test_leave_request
    puts "Start test - Employee creates leave request"
    NavigateBrowserExtension.new(driver).breathe_login
    puts "Pass - Navigate to Login Screen" 
    sleep 1
    LoginExtension.new(driver).login_holiday_employee
    puts "Pass - Login as employee"
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts "Pass - Selects HR"  
    sleep 1
    EmployeeDashboardExtension.new(driver).make_holiday_request
    puts "Pass - Opens leave request" 
    sleep 1
    HolidayExtension.new(driver).holiday_form_complete_employee
    puts "Pass - Completes leave request" 
    sleep 1
    EmployeeDashboardExtension.new(driver).view_holiday_request
    puts "Pass - Displays leave request" 
    sleep 1
    LogoutExtension.new(driver).user_logout
    puts 'Pass - Holiday Employee logged out'
    puts "Test complete - Employee creates leave request"

    NavigateBrowserExtension.new(driver).breathe_login
    puts 'Start Test - Holiday approver approves request'
    puts "Pass - Navigate to Login Screen" 
    sleep 1
    LoginExtension.new(driver).login_admin
    puts "Pass - Login as admin"
    sleep 1
    LoginAppExtension.new(driver).select_hr
    puts "Pass - Selects HR"  
    sleep 1
    HolidayExtension.new(driver).holiday_employee_absence_index_requests
    puts "Pass - Navigate to holiday employee absences" 
    sleep 1
    HolidayExtension.new(driver).approve_leave_request
    puts "Pass - approve employee leave request" 
    sleep 1
    HolidayExtension.new(driver).holiday_employee_absence_index
    puts "Pass - Navigate to holiday employee absences"
    HolidayExtension.new(driver).booked_amount_test_one == "0.5 days"
    puts "Pass - Booked amount is corrct - 0.5 days"
    HolidayExtension.new(driver).available_amount_test_one == "19.5 days"
    puts "Pass - Available amount is corrct - 19.5 days"
    puts "Test complete - Approver can approve holiday request"
  end
end

TestLeaveRequest.new.test_leave_request
