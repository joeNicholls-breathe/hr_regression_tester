# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class SaasExtension < Base
  def delete_account_from_direct_search_account_page
    driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').send_keys 'Regression Account1'
    sleep 8
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr > td.actions').click
    sleep 0.5
  end

  def search_direct_trial_account
    driver.find_element(css: '#DataTables_Table_0_filter > label > input').send_keys '3481'
    Sleep 2
    driver.find_element(class: 'go-to-account').click
  end

  def add_the_ability_for_the_account_to_cancel
    driver.action.move_to(id: 'account_cancellation_enabled_true').perform
    # cancelradioelement = driver.FindElement(id: 'account_cancellation_enabled_true')
    # Actions actions = new(driver);
    # actions.MoveToElement(cancelradioelement);
    # actions.Perform();
    driver.find_element(id: 'account_cancellation_enabled_true').click
    driver.find_element(css: "input[data-disable-with='Update account']").click
  end

  def saas_user_logout
    sleep 3
    driver.find_element(css: 'body > div > section > div > div.col-6.text-right > a').click
  end
end
