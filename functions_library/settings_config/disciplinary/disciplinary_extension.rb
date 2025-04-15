require File.expand_path('../../base.rb', __dir__)

class DisciplinaryExtension < Base
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
    title = nav_links.find { |x| x.attribute('href').include? '#disciplinary-documents' }
    title
  end

  def value_from_table(row, col)
    rows = driver.find_elements(class: 'odd')
    driver.find_elements(class: 'even') << rows
    chosen_row = rows.find{|x| x.attribute('_DT_RowIndex') == row}
    columns = chosen_row.find_elements(tag_name: 'TD')
    columns.find { |x| x.attribute('cellIndex') == col}
  end

  def click_disciplinary_breadcrumb
    driver.find_element(css: 'body > div.hr-main-container > div.hr-main > section > div.breadcrumb > a > svg').click
  end

  def go_to_disciplinary_from_table(row)
    rows = driver.find_elements(class: 'odd')
    driver.find_elements(class: 'even') << rows
    chosen_row = rows.find{|x| x.attribute('_DT_RowIndex') == row}
    actions = chosen_row.find_element(class: 'actions')
    row_actions = actions.find_elements(tag_name: 'A')
    row_actions.find { |x| x.attribute('title') == 'view report'}.click
  end

  def edit_disciplinary_from_table(row)
    rows = driver.find_elements(class: 'odd')
    driver.find_elements(class: 'even') << rows
    chosen_row = rows.find{|x| x.attribute('_DT_RowIndex') == row}
    actions = chosen_row.find_element(class: 'actions')
    row_actions = actions.find_elements(tag_name: 'A')
    row_actions.find { |x| x.attribute('title') == 'edit disciplinary'}.click
  end

  
  def open_edit_document_form
    row = driver.find_element(class: 'odd')
    actions = row.find_element(class: 'actions')
    icons = actions.find_elements(tag_name: 'A')
    icons.find{|x| x.attribute('href').include? 'edit'}.click
  end

  def complete_edit_document_form
    driver.find_element(name: 'employee_document[title]').clear
    driver.find_element(name: 'employee_document[title]').send_keys 'Updated Document'
    driver.find_element(name: 'commit').click
  end

  def delete_document
    actions = driver.find_element(class: 'actions')
    driver.find_element(class: 'delete-icon').click
    sleep 2
    modals = driver.find_elements(class: 'modal-content')
    modal = modals.find{ |x| x.attribute('innerText').include? 'delete this document'}
    modal.find_element(class: 'modal-confirm').click
  end
 
  def delete_disciplinary
    actions = driver.find_element(class: 'actions')
    driver.find_element(class: 'delete-icon').click
    sleep 2
    modals = driver.find_elements(class: 'modal-content')
    modal = modals.find{ |x| x.attribute('innerText').include? 'delete this record'}
    modal.find_element(class: 'modal-confirm').click
  end


  def verify_emp_cant_view_docs
    nav_links = driver.find_elements(class: 'nav-link')
    title = nav_links.find { |x| x.attribute('href').include? '#disciplinary-documents' }
    if title != nil
      return false
    else
      return true
    end
  end

  def attempt_to_open_document_upload_url(employee_id, documentable_id)
    driver.navigate.to("https://hr.breathehrstaging.com/employees/#{employee_id}/documents/new?anchor_id=disciplinary-documents&documentable_id=#{documentable_id}&documentable_type=Grievance&from_section=disciplinary")
  end
  
  def attempt_to_open_notes_upload_url(employee_id, documentable_id)
    driver.navigate.to("https://hr.breathehrstaging.com/employees/#{employee_id}/disciplinaries/#{documentable_id}/grievance_notes/new")
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
    title = nav_links.find { |x| x.attribute('href').include? '#notes-tab' }
    title
  end

  def verify_emp_cant_view_notes
    nav_links = driver.find_elements(class: 'nav-link')
    title = nav_links.find { |x| x.attribute('href').include? '#notes-tab' }
    if title != nil
      return false
    else
      return true
    end
  end

  def check_for_empty_disciplinary_table
    driver.find_element(class: 'blankstate').displayed?
  end

  def delete_note
    actions = driver.find_element(class: 'actions')
    driver.find_element(class: 'delete-icon').click
    sleep 2
    modals = driver.find_elements(class: 'modal-content')
    modal = modals.find{ |x| x.attribute('innerText').include? 'delete this note'}
    modal.find_element(class: 'modal-confirm').click
  end
  
  def complete_disciplinary_edit_form 
    appeal_status = driver.find_element(name: 'grievance[appeal_status]')
    select = Selenium::WebDriver::Support::Select.new(appeal_status)
    select.select_by(:text, 'Appeal completed')
    outcome = driver.find_element(name: 'grievance[company_disciplinary_outcome_id]')
    select = Selenium::WebDriver::Support::Select.new(outcome)
    select.select_by(:text, 'Verbal Warning')
    driver.find_element(name: 'commit').click
  end
end
