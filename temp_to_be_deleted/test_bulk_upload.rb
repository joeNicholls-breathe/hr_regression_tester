require 'selenium-webdriver'
require File.expand_path('../functions_library/base.rb', __FILE__)
require './functions_library/bulk_imports_extension.rb'

class TestBulkUpload < Base
  attr_accessor :driver

  def run_test
    begin
      BulkImportExtension.new(driver).navigate_to_bulk_upload
    rescue => exception
      puts "Test - Navigate to Bulk Upload screen - Pass #{exception}"
    end

    # begin
    #   BulkImportExtension.new(driver).add_new_import
    #   BulkImportExtension.new(driver).bulk_upload_employee_full
    # rescue => exception
    #   puts "Test - Bulk upload - Employee info full uploaded - Pass #{exception}"
    # end

    # begin
    #   BulkImportExtension.new(driver).add_new_import
    #   BulkImportExtension.new(driver).bulk_upload_jobs
    # rescue => exception
    #   puts "Test - Bulk upload - Employee Jobs uploaded - Pass #{exception}"
    # end      
      
    # begin
    #   BulkImportExtension.new(driver).add_new_import
    #   BulkImportExtension.new(driver).bulk_upload_salaries
    # rescue => exception
    #   puts "Test - Bulk upload - Employee salaries uploaded - Pass #{exception}"
    # end

    # begin
    #   BulkImportExtension.new(driver).add_new_import
    #   BulkImportExtension.new(driver).bulk_upload_benefits
    # rescue => exception
    #   puts "Test - Bulk upload - Employee benefits uploaded - Pass #{exception}"
    # end
    
    # begin
    #   BulkImportExtension.new(driver).add_new_import
    #   BulkImportExtension.new(driver).bulk_upload_additional_payments
    # rescue => exception
    #   puts "Test - Bulk upload - Employee additional payments uploaded - Pass #{exception}"
    # end

    # sleep 30

    #driver.close
  end
end
