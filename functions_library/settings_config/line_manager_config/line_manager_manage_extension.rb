# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class LineManagerManageConfigExtension < Base
  def line_manager_configuration_on_profile_manage
    driver.find_element(id: 'account_line_manager_privilege_profile_save').click
  end

  def line_manager_configuration_on_personal_profile_manage
    driver.find_element(id: 'account_line_manager_privilege_personal_profile_save').click
  end

  def line_manager_configuration_on_leave_manage
    driver.find_element(id: 'account_line_manager_privilege_leave_save').click
  end

  def line_manager_configuration_on_adjustments_and_toil_manage
    driver.find_element(id: 'account_line_manager_privilege_adjustments_save').click
  end

  def line_manager_configuration_on_sickness_manage
    driver.find_element(id: 'account_line_manager_privilege_sickness_save').click
  end

  def line_manager_configuration_on_training_manage
    driver.find_element(id: 'account_line_manager_privilege_training_save').click
  end

  def line_manager_configuration_on_one_to_ones_manage
    driver.find_element(id: 'account_line_manager_privilege_one_to_ones_save').click
  end

  def line_manager_configuration_on_objectives_manage
    driver.find_element(id: 'account_line_manager_privilege_objectives_save').click
  end

  def line_manager_configuration_on_deliverables_manage
    driver.find_element(id: 'account_line_manager_privilege_deliverables_save').click
  end

  def line_manager_configuration_on_job_details_manage
    driver.find_element(id: 'account_line_manager_privilege_job_details_save').click
  end

  def line_manager_configuration_on_remuneration_manage
    driver.find_element(id: 'account_line_manager_privilege_remuneration_save').click
  end

  def line_manager_configuration_on_emergency_contacts_manage
    driver.find_element(id: 'account_line_manager_privilege_emergency_contacts_save').click
  end

  def line_manager_configuration_on_medical_facts_manage
    driver.find_element(id: 'account_line_manager_privilege_medical_facts_save').click
  end

  def line_manager_configuration_on_personal_history_manage
    driver.find_element(id: 'account_line_manager_privilege_personal_history_save').click
  end

  def line_manager_configuration_on_notes_manage
    driver.find_element(id: 'account_line_manager_privilege_notes_save').click
  end

  def line_manager_configuration_on_equipment_manage
    driver.find_element(id: 'account_line_manager_privilege_assets_save').click
  end

  def line_manager_configuration_on_id_documents_manage
    driver.find_element(id: 'account_line_manager_privilege_id_documents_save').click
  end

  def line_manager_configuration_on_dbs_checks_manage
    driver.find_element(id: 'account_line_manager_privilege_crb_checks_save').click
  end

  def line_manager_configuration_on_grievances_and_disciplinaries_manage
    driver.find_element(id: 'account_line_manager_privilege_grievances_save').click
  end

  def line_manager_configuration_on_time_logs_manage
    driver.find_element(id: 'account_line_manager_privilege_time_logs_save').click
  end

  def line_manager_configuration_onboarding_manage
    driver.find_element(id: 'account_line_manager_privilege_employee_tasks_save').click
  end

  def line_manager_configurations_update
    driver.find_element(css: '#edit_account_line_manager_privilege_3857 > div:nth-child(4) > div > p > input').click
  end

  def line_manager_configurations_cancel
    driver.find_element(css: 'href="/account/settings"').click
  end
end
