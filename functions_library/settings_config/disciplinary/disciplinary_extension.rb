# frozen_string_literal: true

require File.expand_path('../../base.rb', __dir__)

class DisciplinaryExtension < Base # rubocop:disable Metrics/ClassLength
  def open_disciplinary_form
    driver.find_element(class: 'fa-stack').click
  end

  def open_disciplinary_for_tomorrow
    driver.find_element(id: '#grievance_date_of_incident_react').send_keys tomorrow
    driver.find_element(id: 'grievance_desc').send_keys 'Regression Testing'
    driver.find_element(name: 'commit').click
  end

  def switch_to_documents_tab
    nav_links = driver.find_elements(class: 'nav-link')
    docs = nav_links.find { |x| x.attribute('href').include? '#disciplinary-documents' }
    docs.click
  end

  def open_document_upload_form
    docs = driver.find_element(id: 'disciplinary-documents')
    docs.find_element(class: 'fa-stack').click
  end

  def complete_document_upload_form_pdf
    upload_file = File.expand_path(
      '../../employee_imports/positive_imports/Disciplinary.pdf', __dir__
    )
    file_input = driver.find_element(name: 'employee_document[file]')
    file_input.send_keys(upload_file)
    driver.find_element(name: 'employee_document[title]').send_keys 'Regression File'
    driver.find_element(name: 'commit').click
  end

  def complete_document_upload_form
    upload_file = File.expand_path(
      '../../employee_imports/positive_imports/disciplinary_upload.txt', __dir__
    )
    file_input = driver.find_element(name: 'employee_document[file]')
    file_input.send_keys(upload_file)
    driver.find_element(name: 'employee_document[title]').send_keys 'Regression File'
    driver.find_element(name: 'commit').click
  end

  def title_of_documents_nav_link
    nav_links = driver.find_elements(class: 'nav-link')
    nav_links.find { |x| x.attribute('href').include? '#disciplinary-documents' }
  end

  def value_from_table(row, col)
    rows = driver.find_elements(class: 'odd')
    driver.find_elements(class: 'even') << rows
    chosen_row = rows.find { |x| x.attribute('_DT_RowIndex') == row }
    columns = chosen_row.find_elements(tag_name: 'TD')
    columns.find { |x| x.attribute('cellIndex') == col }
  end

  def click_disciplinary_breadcrumb
    driver.find_element(css: 'body > div.hr-main-container > div.hr-main > section > div.breadcrumb > a > svg').click
  end

  def edit_disciplinary_from_table(row)
    rows = driver.find_elements(class: 'odd')
    driver.find_elements(class: 'even') << rows
    chosen_row = rows.find { |x| x.attribute('_DT_RowIndex') == row }
    actions = chosen_row.find_element(class: 'actions')
    row_actions = actions.find_elements(tag_name: 'A')
    row_actions.find { |x| x.attribute('title') == 'edit disciplinary' }.click
  end

  def open_edit_document_form
    row = driver.find_element(class: 'odd')
    actions = row.find_element(class: 'actions')
    icons = actions.find_elements(tag_name: 'A')
    icons.find { |x| x.attribute('href').include? 'edit' }.click
  end

  def complete_edit_document_form
    driver.find_element(name: 'employee_document[title]').clear
    driver.find_element(name: 'employee_document[title]').send_keys 'Updated Document'
    driver.find_element(name: 'commit').click
  end

  def delete_document
    driver.find_element(class: 'actions')
    driver.find_element(class: 'delete-icon').click
    sleep 2
    modals = driver.find_elements(class: 'modal-content')
    modal = modals.find { |x| x.attribute('innerText').include? 'delete this document' }
    modal.find_element(class: 'modal-confirm').click
  end

  def delete_disciplinary
    driver.find_element(class: 'actions')
    driver.find_element(class: 'delete-icon').click
    sleep 2
    modals = driver.find_elements(class: 'modal-content')
    modal = modals.find { |x| x.attribute('innerText').include? 'delete this record' }
    modal.find_element(class: 'modal-confirm').click
  end

  def view_pdf_document
    row = driver.find_element(class: 'odd')
    actions = row.find_element(class: 'actions')
    icons = actions.find_elements(tag_name: 'A')
    icons.find { |x| x.attribute('href').include? 'preview' }.click
  end

  def verify_emp_cant_view_docs
    nav_links = driver.find_elements(class: 'nav-link')
    title = nav_links.find { |x| x.attribute('href').include? '#disciplinary-documents' }
    return false unless title.nil?

    true
  end

  def open_notes_upload_form
    notes = driver.find_element(id: 'notes-tab')
    notes.find_element(class: 'fa-stack').click
  end

  def complete_notes_form(note_message)
    driver.find_element(name: 'grievance_note[note]').clear
    driver.find_element(name: 'grievance_note[note]').send_keys note_message
    driver.find_element(name: 'commit').click
  end

  def title_of_notes_nav_link
    nav_links = driver.find_elements(class: 'nav-link')
    nav_links.find { |x| x.attribute('href').include? '#notes-tab' }
  end

  def verify_emp_cant_view_notes
    nav_links = driver.find_elements(class: 'nav-link')
    title = nav_links.find { |x| x.attribute('href').include? '#notes-tab' }
    return false unless title.nil?

    true
  end

  def delete_note
    driver.find_element(class: 'actions')
    driver.find_element(class: 'delete-icon').click
    sleep 2
    modals = driver.find_elements(class: 'modal-content')
    modal = modals.find { |x| x.attribute('innerText').include? 'delete this note' }
    modal.find_element(class: 'modal-confirm').click
  end

  def complete_disciplinary_edit_form
    driver.find_element(name: 'grievance[desc]').clear
    driver.find_element(name: 'grievance[desc]').send_keys 'Edited Regression Testing'
    set_appeal_status_to_completed
    set_outcome_to_verbal_warning
    mark_as_resolved
    driver.find_element(name: 'commit').click
  end

  def mark_as_resolved
    checkboxes = driver.find_elements(class: 'checkbox')
    resolved = checkboxes.find { |x| x.text == 'mark as resolved' }
    resolved.find_element(id: 'grievance_resolved').click
  end

  def set_appeal_status_to_completed
    appeal_status = driver.find_element(name: 'grievance[appeal_status]')
    select = Selenium::WebDriver::Support::Select.new(appeal_status)
    select.select_by(:text, 'Appeal completed')
  end

  def set_outcome_to_verbal_warning
    outcome = driver.find_element(name: 'grievance[company_disciplinary_outcome_id]')
    select = Selenium::WebDriver::Support::Select.new(outcome)
    select.select_by(:text, 'Verbal Warning')
  end

  def resolved_today
    today = todays_date_string_slash
    "resolved on #{today}"
  end

  def check_last_note
    if value_from_table('0', '4').text == todays_date_string_slash
      true
    else
      puts value_from_table('0', '4').text
      false
    end
  end
end
