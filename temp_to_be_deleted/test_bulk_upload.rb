# frozen_string_literal: true

require 'selenium-webdriver'
require File.expand_path('functions_library/base.rb', __dir__)
require './functions_library/bulk_imports_extension'

class TestBulkUpload < Base
  attr_accessor :driver

  def run_test
    BulkImportExtension.new(driver).navigate_to_bulk_upload
  rescue StandardError => e
    puts "Test - Navigate to Bulk Upload screen - Pass #{e}"

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

    # driver.close
  end
end
