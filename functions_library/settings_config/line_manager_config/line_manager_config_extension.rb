# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

# rubocop:disable Metrics/ClassLength
class LineManagerConfigExtension < Base
  def line_manager_configuration_on_profile_manage
    driver.find_element(id: 'account_line_manager_privilege_profile_save').click
  end

  def line_manager_configuration_on_profile_delete_docs_only
    driver.find_element(id: 'account_line_manager_privilege_profile_delete').click
  end

  def line_manager_configuration_on_personal_profile_view
    driver.find_element(id: 'account_line_manager_privilege_personal_profile_show').click
  end

  def line_manager_configuration_on_personal_profile_manage
    driver.find_element(id: 'account_line_manager_privilege_personal_profile_save').click
  end

  def line_manager_configuration_on_leave_view
    driver.find_element(id: 'account_line_manager_privilege_leave_show').click
  end

  def line_manager_configuration_on_leave_manage
    driver.find_element(id: 'account_line_manager_privilege_leave_save').click
  end

  def line_manager_configuration_on_leave_delete
    driver.find_element(id: 'account_line_manager_privilege_leave_delete').click
  end

  def line_manager_configuration_on_adjustments_and_toil_view
    driver.find_element(id: 'account_line_manager_privilege_adjustments_show').click
  end

  def line_manager_configuration_on_adjustments_and_toil_manage
    driver.find_element(id: 'account_line_manager_privilege_adjustments_save').click
  end

  def line_manager_configuration_on_sickness_view
    driver.find_element(id: 'account_line_manager_privilege_sickness_show').click
  end

  def line_manager_configuration_on_sickness_manage
    driver.find_element(id: 'account_line_manager_privilege_sickness_save').click
  end

  def line_manager_configuration_on_sickness_delete
    driver.find_element(id: 'account_line_manager_privilege_sickness_delete').click
  end

  def line_manager_configuration_on_training_view
    driver.find_element(id: 'account_line_manager_privilege_training_show').click
  end

  def line_manager_configuration_on_training_manage
    driver.find_element(id: 'account_line_manager_privilege_training_save').click
  end

  def line_manager_configuration_on_training_delete
    driver.find_element(id: 'account_line_manager_privilege_training_delete').click
  end

  def line_manager_configuration_on_one_to_ones_view
    driver.find_element(id: 'account_line_manager_privilege_one_to_ones_show').click
  end

  def line_manager_configuration_on_one_to_ones_manage
    driver.find_element(id: 'account_line_manager_privilege_one_to_ones_save').click
  end

  def line_manager_configuration_on_one_to_ones_delete
    driver.find_element(id: 'account_line_manager_privilege_one_to_ones_delete').click
  end

  def line_manager_configuration_on_objectives_view
    driver.find_element(id: 'account_line_manager_privilege_objectives_show').click
  end

  def line_manager_configuration_on_objectives_manage
    driver.find_element(id: 'account_line_manager_privilege_objectives_save').click
  end

  def line_manager_configuration_on_objectives_delete
    driver.find_element(id: 'account_line_manager_privilege_objectives_delete').click
  end

  def line_manager_configuration_on_deliverables_view
    driver.find_element(id: 'account_line_manager_privilege_deliverables_show').click
  end

  def line_manager_configuration_on_deliverables_manage
    driver.find_element(id: 'account_line_manager_privilege_deliverables_save').click
  end

  def line_manager_configuration_on_deliverables_delete
    driver.find_element(id: 'account_line_manager_privilege_deliverables_delete').click
  end

  def line_manager_configuration_on_job_details_view
    driver.find_element(id: 'account_line_manager_privilege_job_details_show').click
  end

  def line_manager_configuration_on_job_details_manage
    driver.find_element(id: 'account_line_manager_privilege_job_details_save').click
  end

  def line_manager_configuration_on_job_details_delete
    driver.find_element(id: 'account_line_manager_privilege_job_details_delete').click
  end

  def line_manager_configuration_on_remuneration_view
    driver.find_element(id: 'account_line_manager_privilege_remuneration_show').click
  end

  def line_manager_configuration_on_remuneration_manage
    driver.find_element(id: 'account_line_manager_privilege_remuneration_save').click
  end

  def line_manager_configuration_on_remuneration_delete
    driver.find_element(id: 'account_line_manager_privilege_remuneration_delete').click
  end

  def line_manager_configuration_on_emergency_contacts_view
    driver.find_element(id: 'account_line_manager_privilege_emergency_contacts_show').click
  end

  def line_manager_configuration_on_emergency_contacts_manage
    driver.find_element(id: 'account_line_manager_privilege_emergency_contacts_save').click
  end

  def line_manager_configuration_on_emergency_contacts_delete
    driver.find_element(id: 'account_line_manager_privilege_emergency_contacts_delete').click
  end

  def line_manager_configuration_on_medical_facts_view
    driver.find_element(id: 'account_line_manager_privilege_medical_facts_show').click
  end

  def line_manager_configuration_on_medical_facts_manage
    driver.find_element(id: 'account_line_manager_privilege_medical_facts_save').click
  end

  def line_manager_configuration_on_medical_facts_delete
    driver.find_element(id: 'account_line_manager_privilege_medical_facts_delete').click
  end

  def line_manager_configuration_on_personal_history_view
    driver.find_element(id: 'account_line_manager_privilege_personal_history_show').click
  end

  def line_manager_configuration_on_personal_history_manage
    driver.find_element(id: 'account_line_manager_privilege_personal_history_save').click
  end

  def line_manager_configuration_on_personal_history_delete
    driver.find_element(id: 'account_line_manager_privilege_personal_history_delete').click
  end

  def line_manager_configuration_on_notes_view
    driver.find_element(id: 'account_line_manager_privilege_notes_show').click
  end

  def line_manager_configuration_on_notes_manage
    driver.find_element(id: 'account_line_manager_privilege_notes_save').click
  end

  def line_manager_configuration_on_notes_delete
    driver.find_element(id: 'account_line_manager_privilege_notes_delete').click
  end

  def line_manager_configuration_on_equipment_view
    driver.find_element(id: 'account_line_manager_privilege_assets_show').click
  end

  def line_manager_configuration_on_equipment_manage
    driver.find_element(id: 'account_line_manager_privilege_assets_save').click
  end

  def line_manager_configuration_on_equipment_delete
    driver.find_element(id: 'account_line_manager_privilege_assets_delete').click
  end

  def line_manager_configuration_on_id_documents_view
    driver.find_element(id: 'account_line_manager_privilege_id_documents_show').click
  end

  def line_manager_configuration_on_id_documents_manage
    driver.find_element(id: 'account_line_manager_privilege_id_documents_save').click
  end

  def line_manager_configuration_on_id_documents_delete
    driver.find_element(id: 'account_line_manager_privilege_id_documents_delete').click
  end

  def line_manager_configuration_on_dbs_checks_view
    driver.find_element(id: 'account_line_manager_privilege_crb_checks_show').click
  end

  def line_manager_configuration_on_dbs_checks_manage
    driver.find_element(id: 'account_line_manager_privilege_crb_checks_save').click
  end

  def line_manager_configuration_on_dbs_checks_delete
    driver.find_element(id: 'account_line_manager_privilege_crb_checks_delete').click
  end

  def line_manager_configuration_on_grievances_and_disciplinaries_view
    driver.find_element(id: 'account_line_manager_privilege_grievances_show').click
  end

  def line_manager_configuration_on_grievances_and_disciplinaries_manage
    driver.find_element(id: 'account_line_manager_privilege_grievances_save').click
  end

  def line_manager_configuration_on_grievances_and_disciplinaries_delete
    driver.find_element(id: 'account_line_manager_privilege_grievances_delete').click
  end

  def line_manager_configuration_on_time_logs_view
    driver.find_element(id: 'account_line_manager_privilege_time_logs_show').click
  end

  def line_manager_configuration_on_time_logs_manage
    driver.find_element(id: 'account_line_manager_privilege_time_logs_save').click
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

  def line_manager_able_to_see_their_peoples_people
    driver.find_element(id: 'line_manager_levels').click
  end

  def line_manage_able_to_see_their_peoples_bank_details
    driver.find_element(id: 'line_managers_see_bank').click
  end
end
# rubocop:enable Metrics/ClassLength
