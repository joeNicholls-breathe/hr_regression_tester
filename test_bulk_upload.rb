require 'selenium-webdriver'
require './functions_library/navigate_browser_extension.rb'
require './functions_library/bulk_import_extension.rb'

class TestBulkUpload
  attr_accessor :driver

  def initialize
    #@driver = Selenium::WebDriver.for :firefox
  end

  def run_test
    begin
      BulkImportExtension.new(driver).navigate_to_bulk_upload
    rescue => exception
      puts "Test - Navigate to Bulk Upload screen - Pass #{exception}"
    end

    begin
      BulkImportExtension.new(driver).add_new_import
      BulkImportExtension.new(driver).bulk_upload_employee_full
    rescue => exception
      puts "Test - Bulk upload - Employee info full uploaded - Pass #{exception}"
    end

    begin
      BulkImportExtension.new(driver).add_new_import
      BulkImportExtension.new(driver).bulk_upload_jobs
    rescue => exception
      puts "Test - Bulk upload - Employee Jobs uploaded - Pass #{exception}"
    end      
      
    begin
      BulkImportExtension.new(driver).add_new_import
      BulkImportExtension.new(driver).bulk_upload_salaries
    rescue => exception
      puts "Test - Bulk upload - Employee salaries uploaded - Pass #{exception}"
    end

    begin
      BulkImportExtension.new(driver).add_new_import
      BulkImportExtension.new(driver).bulk_upload_benefits
    rescue => exception
      puts "Test - Bulk upload - Employee benefits uploaded - Pass #{exception}"
    end
    
    begin
      BulkImportExtension.new(driver).add_new_import
      BulkImportExtension.new(driver).bulk_upload_additional_payments
    rescue => exception
      puts "Test - Bulk upload - Employee additional payments uploaded - Pass #{exception}"
    end

    Sleep 30

    #driver.close
  end
end

TestBulkUpload.new.run_test
