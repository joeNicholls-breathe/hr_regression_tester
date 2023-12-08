# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class LineManagerViewConfigExtension < Base
  def line_manager_configuration_on_personal_profile_view
    driver.find_element(id: 'account_line_manager_privilege_personal_profile_show').click
  end

  def line_manager_configuration_on_leave_view
    driver.find_element(id: 'account_line_manager_privilege_leave_show').click
  end

  def line_manager_configuration_on_adjustments_and_toil_view
    driver.find_element(id: 'account_line_manager_privilege_adjustments_show').click
  end

  def line_manager_configuration_on_sickness_view
    driver.find_element(id: 'account_line_manager_privilege_sickness_show').click
  end

  def line_manager_configuration_on_training_view
    driver.find_element(id: 'account_line_manager_privilege_training_show').click
  end

  def line_manager_configuration_on_one_to_ones_view
    driver.find_element(id: 'account_line_manager_privilege_one_to_ones_show').click
  end

  def line_manager_configuration_on_objectives_view
    driver.find_element(id: 'account_line_manager_privilege_objectives_show').click
  end

  def line_manager_configuration_on_deliverables_view
    driver.find_element(id: 'account_line_manager_privilege_deliverables_show').click
  end

  def line_manager_configuration_on_job_details_view
    driver.find_element(id: 'account_line_manager_privilege_job_details_show').click
  end

  def line_manager_configuration_on_remuneration_view
    driver.find_element(id: 'account_line_manager_privilege_remuneration_show').click
  end

  def line_manager_configuration_on_emergency_contacts_view
    driver.find_element(id: 'account_line_manager_privilege_emergency_contacts_show').click
  end

  def line_manager_configuration_on_medical_facts_view
    driver.find_element(id: 'account_line_manager_privilege_medical_facts_show').click
  end

  def line_manager_configuration_on_personal_history_view
    driver.find_element(id: 'account_line_manager_privilege_personal_history_show').click
  end

  def line_manager_configuration_on_grievances_and_disciplinaries_view
    driver.find_element(id: 'account_line_manager_privilege_grievances_show').click
  end

  def line_manager_configuration_on_notes_view
    driver.find_element(id: 'account_line_manager_privilege_notes_show').click
  end

  def line_manager_configuration_on_equipment_view
    driver.find_element(id: 'account_line_manager_privilege_assets_show').click
  end

  def line_manager_configuration_on_id_documents_view
    driver.find_element(id: 'account_line_manager_privilege_id_documents_show').click
  end

  def line_manager_configuration_on_dbs_checks_view
    driver.find_element(id: 'account_line_manager_privilege_crb_checks_show').click
  end

  def line_manager_configuration_on_time_logs_view
    driver.find_element(id: 'account_line_manager_privilege_time_logs_show').click
  end

  def line_manager_configurations_update
    driver.find_element(xpath: '//*[@id="edit_account_line_manager_privilege_2827"]/div[2]/div/p/input').click
  end

  def line_manager_configurations_cancel
    driver.find_element(css: 'href="/account/settings"').click
  end
end
