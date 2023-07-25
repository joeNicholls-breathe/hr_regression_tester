require File.expand_path('../../../base.rb', __FILE__)

class AccountPicklistPerformanceExtension < Base
#disciplinary outcomes
  def performance_management_disciplinary_outcomes_new
    driver.find_element(css: 'href="/company_disciplinary_outcomes"').click
    driver.find_element(css: 'href="/company_disciplinary_outcomes/new"').click
    driver.find_element(id: 'company_disciplinary_outcome_name').sendkeys "Regression Test - NEW DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_disciplinary_outcome"]/p/input').click
  end

  def performance_management_disciplinary_outcomes_edit
    driver.find_element(css: 'href="/company_disciplinary_outcomes"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a:nth-child(1) > svg').click
    driver.find_element(id: 'company_disciplinary_outcome_name').sendkeys "Regression Test - EDIT DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_disciplinary_outcome"]/p/input').click
  end

  def performance_management_disciplinary_outcomes_cancel_new
    driver.find_element(css: 'href="/company_disciplinary_outcomes"').click
    driver.find_element(css: 'href="/company_disciplinary_outcomes/new"').click
    driver.find_element(id: 'company_disciplinary_outcome_name').sendkeys "Regression Test - NEW DATE TODAY"
    driver.find_element(css: 'href="/company_disciplinary_outcomes/new"').click
  end

  def performance_management_disciplinary_outcomes_delete
    driver.find_element(css: 'href="/company_disciplinary_outcomes"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="delete_type_19803"]/div/div/div[3]/button[2]').click
  end

  def performance_management_disciplinary_outcomes_search
    driver.find_element(css: 'href="/company_disciplinary_outcomes"').click
    driver.find_element(id: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Regression Test - NEW DATE TODAY"
    sleep 1
  end

  def performance_management_disciplinary_outcomes_breadcrumb
    driver.find_element(css: 'href="/company_disciplinary_outcomes"').click
    driver.find_element(css: 'href="/company_disciplinary_outcomes/new"').click
    driver.find_element(id: 'company_disciplinary_outcome_name').sendkeys "Regression Test - BREADCRUMB DATE TODAY"
    driver.find_element(css: 'href="/company_disciplinary_outcomes"').click
  end

#grievence outcomes
  def performance_management_grievance_outcomes_new
    driver.find_element(css: 'href="/company_grievance_outcomes"').click
    driver.find_element(css: 'href="/company_grievance_outcomes/new"').click
    driver.find_element(id: 'company_grievance_outcome_name').sendkeys "Regression Test NEW DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_grievance_outcome"]/p/input').click
  end
  
  def performance_management_grievance_outcomes_edit
    driver.find_element(css: 'href="/company_grievance_outcomes"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a:nth-child(1) > svg').click
    driver.find_element(id: 'company_grievance_outcome_name').sendkeys "Regression Test EDIT DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_grievance_outcome"]/p/input').click
  end
  
  def performance_management_grievance_outcomes_cancel_new
    driver.find_element(css: 'href="/company_grievance_outcomes"').click
    driver.find_element(css: 'href="/company_grievance_outcomes/new"').click
    driver.find_element(id: 'company_grievance_outcome_name').sendkeys "Regression Test CANCEL NEW DATE TODAY"
    driver.find_element(css: 'href="/company_grievance_outcomes"').click
  end

  def performance_management_grievance_outcomes_delete
    driver.find_element(css: 'href="/company_grievance_outcomes"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="delete_type_8488"]/div/div/div[3]/button[2]').click
  end

  def performance_management_grievance_outcomes_search
    driver.find_element(css: 'href="/company_grievance_outcomes"').click
    driver.find_element(css: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Regression Test NEW DATE TODAY"
    sleep 1 
  end

  def performance_management_grievance_outcomes_breadcrumb
    driver.find_element(css: 'href="/company_grievance_outcomes"').click
    driver.find_element(css: 'href="/company_grievance_outcomes/new"').click
    driver.find_element(id: 'company_grievance_outcome_name').sendkeys "Regression Test BREADCRUMB DATE TODAY"
    driver.find_element(css: 'href="/company_grievance_outcomes"').click
  end

#one to ones
  def performance_management_one_to_one_types_new
    driver.find_element(css: 'href="/company_one_to_one_types"').click
    driver.find_element(css: 'href="/company_one_to_one_types/new"').click
    driver.find_element(id: 'company_one_to_one_type_name').sendkeys "Regression Test NEW DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_one_to_one_type"]/p/input').click
  end

  def performance_management_one_to_one_types_edit
    driver.find_element(css: 'href="/company_one_to_one_types"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a > svg').click
    driver.find_element(id: 'company_one_to_one_type_name').sendkeys "Regression Test EDIT DATE TODAY"
    driver.find_element(xpath: '//*[@id="new_company_one_to_one_type"]/p/input').click
  end

  def performance_management_one_to_one_types_cancel_new
    driver.find_element(css: 'href="/company_one_to_one_types"').click
    driver.find_element(css: 'href="/company_one_to_one_types/new"').click
    driver.find_element(id: 'company_one_to_one_type_name').sendkeys "Regression Test CANCEL NEW DATE TODAY"
    driver.find_element(xpath: '').click
  end
  
  def performance_management_one_to_one_types_delete
    driver.find_element(css: 'href="/company_one_to_one_types"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(3) > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="delete_type"]/div/div/div[3]/button[2]').click
  end
  
  def performance_management_one_to_one_types_search
    driver.find_element(css: 'href="/company_one_to_one_types"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Regression Test NEW DATE TODAY"
    sleep 1
  end

  def performance_management_one_to_one_types_search_breadcrumb
    driver.find_element(css: 'href="/company_one_to_one_types"').click
    driver.find_element(css: 'href="/company_one_to_one_types/new"').click
    driver.find_element(id: 'company_one_to_one_type_name').sendkeys "Regression Test BREADCRUMB TODAY"
    driver.find_element(css: 'href="/company_one_to_one_types"').click
  end
end
