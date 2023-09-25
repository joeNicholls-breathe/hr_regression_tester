require File.expand_path('../../../base.rb', __FILE__)

class EmailNotificationConfigExtension < Base 
  def system_notifications_on
    driver.find_element(id: 'account_email_notifications_enabled_1').click
    driver.find_element(xpath: '//*[@id="edit_account_3899"]/p/input').click  #will need to amend to id of company
  end

  def system_notifications_off
    driver.find_element(id: 'account_email_notifications_enabled_0').click
    driver.find_element(xpath: '//*[@id="edit_account_3899"]/p/input').click  #will need to amend to id of company
  end

  def third_party_email_invoice
    driver.find_element(id: 'account_copy_invoice_email_address').clear
    driver.find_element(id: 'account_copy_invoice_email_address').send_keys "thirdparty@email.com"
    driver.find_element(xpath: '//*[@id="edit_account_3899"]/p/input').click  #will need to amend to id of company
  end 

  def third_party_email_leave_request_approval
    driver.find_element(id: 'account_third_party_holiday_recipient').clear
    driver.find_element(id: 'account_third_party_holiday_recipient').send_keys "thirdparty@email.com"
    driver.find_element(xpath: '//*[@id="edit_account_3899"]/p/input').click  #will need to amend to id of company
  end 
  
  def third_party_email_approved_expenses
    driver.find_element(id: 'account_expense_payer_email').clear
    driver.find_element(id: 'account_expense_payer_email').send_keys "thirdparty@email.com"
    driver.find_element(xpath: '//*[@id="edit_account_3899"]/p/input').click  #will need to amend to id of company
  end 
end
