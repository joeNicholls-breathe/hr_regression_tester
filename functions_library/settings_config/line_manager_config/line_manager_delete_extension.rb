# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)
class LineManagerDeleteConfigExtension < Base
  def line_manager_profile_delete_docs_only
    driver.find_element(id: 'account_line_manager_privilege_profile_delete').click
  end

  def line_manager_leave_delete
    driver.find_element(id: 'account_line_manager_privilege_leave_delete').click
  end

  def line_manager_sickness_delete
    driver.find_element(id: 'account_line_manager_privilege_sickness_delete').click
  end

  def line_manager_training_delete
    driver.find_element(id: 'account_line_manager_privilege_training_delete').click
  end

  def line_manager_one_to_ones_delete
    driver.find_element(id: 'account_line_manager_privilege_one_to_ones_delete').click
  end

  def line_manager_objectives_delete
    driver.find_element(id: 'account_line_manager_privilege_objectives_delete').click
  end

  def line_manager_deliverables_delete
    driver.find_element(id: 'account_line_manager_privilege_deliverables_delete').click
  end

  def line_manager_configuration_on_job_details_delete
    driver.find_element(id: 'account_line_manager_privilege_job_details_delete').click
  end

  def line_manager_configuration_on_remuneration_delete
    driver.find_element(id: 'account_line_manager_privilege_remuneration_delete').click
  end

  def line_manager_configuration_on_emergency_contacts_delete
    driver.find_element(id: 'account_line_manager_privilege_emergency_contacts_delete').click
  end

  def line_manager_configuration_on_medical_facts_delete
    driver.find_element(id: 'account_line_manager_privilege_medical_facts_delete').click
  end

  def line_manager_configuration_on_personal_history_delete
    driver.find_element(id: 'account_line_manager_privilege_personal_history_delete').click
  end

  def line_manager_configuration_on_notes_delete
    driver.find_element(id: 'account_line_manager_privilege_notes_delete').click
  end

  def line_manager_configuration_on_equipment_delete
    driver.find_element(id: 'account_line_manager_privilege_assets_delete').click
  end

  def line_manager_configuration_on_id_documents_delete
    driver.find_element(id: 'account_line_manager_privilege_id_documents_delete').click
  end

  def line_manager_configuration_on_dbs_checks_delete
    driver.find_element(id: 'account_line_manager_privilege_crb_checks_delete').click
  end

  def line_manager_configuration_on_grievances_and_disciplinaries_delete
    driver.find_element(id: 'account_line_manager_privilege_grievances_delete').click
  end

  def line_manager_configuration_on_time_logs_delete
    driver.find_element(id: 'account_line_manager_privilege_time_logs_delete').click
  end

  def line_manager_configurations_update
    driver.find_element(xpath: '//*[@id="edit_account_line_manager_privilege_2827"]/div[2]/div/p/input').click
  end

  def line_manager_configurations_cancel
    driver.find_element(css: 'href="/account/settings"').click
  end
end
