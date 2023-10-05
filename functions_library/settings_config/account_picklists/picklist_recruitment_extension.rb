# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class AccountPicklistRecruitmentExtension < Base
  # applicant stages
  def recruitment_applicant_stages_new
    driver.find_element(css: 'href="/recruitment/applicant_stages"').click
    driver.find_element(css: 'href="/recruitment/applicant_stages/new"').click
    driver.find_element(id: 'applicant_stage_name').sendkeys 'Regression Test NEW DATE TODAY'
    driver.find_element(xpath: '//*[@id="new_applicant_stage"]/p/input').click
  end

  def recruitment_applicant_stages_edit
    driver.find_element(css: 'href="/recruitment/applicant_stages"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(3) > td.actions > a:nth-child(1) > svg').click
    driver.find_element(id: 'applicant_stage_name').sendkeys 'Regression Test EDIT DATE TODAY'
    driver.find_element(xpath: '//*[@id="new_applicant_stage"]/p/input').click
  end

  def recruitment_applicant_stages_cancel_new
    driver.find_element(css: 'href="/recruitment/applicant_stages"').click
    driver.find_element(css: 'href="/recruitment/applicant_stages/new"').click
    driver.find_element(id: 'applicant_stage_name').sendkeys 'Regression Test CANCEL DATE TODAY'
    driver.find_element(css: 'href="/recruitment/applicant_stages"').click
  end

  def recruitment_applicant_stages_breadcrumb
    driver.find_element(css: 'href="/recruitment/applicant_stages"').click
    driver.find_element(css: 'href="/recruitment/applicant_stages/new"').click
    driver.find_element(css: 'href="/recruitment/applicant_stages"').click
  end

  def recruitment_applicant_stages_delete
    driver.find_element(css: 'href="/recruitment/applicant_stages"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(3) > td.actions > svg').click
    driver.find_element(
      css: '#delete_type_11782 > div > div > div.modal-footer > button.btn.btn-danger.modal-confirm'
    ).click
  end

  def recruitment_applicant_stages_search
    driver.find_element(css: 'href="/recruitment/applicant_stages"').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input')
          .sendkeys 'Regression Test NEW DATE TODAY'
    sleep 1
  end

  # applicant emails
  def recruitment_applicant_email_edit
    driver.find_element(css: 'href="/recruitment/applicant_stages/emails_index"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a > svg').click
    driver.find_element(id: 'applicant_stage_email_subject').sendkeys 'Regression Test EDIT applicant email DATE TODAY'
    driver.find_element(id: 'applicant_stage_email_text')
          .sendkeys 'Dear Applicant, REgression test has updateed the body of this email DATE TODAY'
    driver.find_element(xpath: '//*[@id="edit_applicant_stage"]/p/input').click
  end

  def recruitment_applicant_email_edit_cancel
    driver.find_element(css: 'href="/recruitment/applicant_stages/emails_index"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a > svg').click
    driver.find_element(id: 'applicant_stage_email_subject').sendkeys 'Regression Test EDIT applicant email DATE TODAY'
    driver.find_element(id: 'applicant_stage_email_text')
          .sendkeys 'Dear Applicant, REgression test has updateed the body of this email DATE TODAY'
    driver.find_element(xpath: '//*[@id="edit_applicant_stage"]/p/a').click
  end

  # applicant sources
  def recruitment_applicant_source_new
    driver.find_element(css: 'href="/applicant_sources"').click
    driver.find_element(css: 'href="/applicant_sources/new"').click
    driver.find_element(id: 'applicant_source_name').sendkeys 'Regression Test NEW DATE TODAY'
    driver.find_element(xpath: '//*[@id="new_applicant_source"]/p/input').click
  end

  def recruitment_applicant_source_cancel_new
    driver.find_element(css: 'href="/applicant_sources"').click
    driver.find_element(css: 'href="/applicant_sources/new"').click
    driver.find_element(id: 'applicant_source_name').sendkeys 'Regression Test CANCEL DATE TODAY'
    driver.find_element(css: 'href="/applicant_sources"').click
  end

  def recruitment_applicant_source_edit
    driver.find_element(css: 'href="/applicant_sources"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > a:nth-child(1) > svg').click
    driver.find_element(id: 'applicant_source_name').sendkeys 'Regression Test EDIT DATE TODAY'
    driver.find_element(xpath: '//*[@id="new_applicant_source"]/p/input').click
  end

  def recruitment_applicant_source_delete
    driver.find_element(css: 'href="/applicant_sources"').click
    driver.find_element(css: '#DataTables_Table_0 > tbody > tr:nth-child(1) > td.actions > svg').click
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[1]/td[2]/svg').click
  end

  def recruitment_applicant_source_search
    driver.find_element(css: 'href="/applicant_sources"').click
    driver.find_element(css: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys 'Agency'
    sleep 1
    # driver.find_element(xpath: '').click
  end
end
