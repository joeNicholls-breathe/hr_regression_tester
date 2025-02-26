# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class EmployeeDashboardExtension < Base
  def my_dashboard
    driver.find_element(xpath: '//*[@id="tab-my-dashboard-link"]/span').click
  end

  def make_holiday_request
    leave_request_button = driver.find_element(css: '#tab-my-dashboard > div > div:nth-child(1) > div.card-footer > a')
    button_href = leave_request_button.property('href')
    employee_id = button_href.split('/')[-3]
    driver.find_element(css: "a[href='/employees/#{employee_id}/leave_requests/new']").click
  end

  def view_holiday_request
    driver.find_element(css: "a[href='/employees/20717/holidays']").click
  end

  def create_sickness_record
    sickness_button = driver.find_element(css: '#tab-my-dashboard > div > div:nth-child(2) > div.card-footer > a')
    button_href = sickness_button.property('href')
    employee_id = button_href.split('/')[-3]
    driver.find_element(css: "a[href='/employees/#{employee_id}/sicknesses/open']").click
  end

  def view_sicknesses
    driver.find_element(css: "a[href='/employees/20717/sicknesses']").click
  end

  def click_widget(widget_text)
    all_widgets = driver.find_elements(class: 'bdds-button--contained')
    widget = all_widgets.find { |x| x.text == widget_text }
    widget.click
  end

  def open_employee_holiday
    # rubocop:disable Layout/LineLength
    driver.find_element(
      css: 'body > div.hr-main-container > div.hr-main > div.new-bootstrap > div:nth-child(1) > div > div > div:nth-child(3) > div > section > div > div > div > div > div > div:nth-child(1) > div > div.bdds-card__header > div.bdds-popover-trigger > button'
    ).click
    sleep 0.25
    buttons = driver.find_elements(class: 'bdds-button--text')
    button = buttons.find { |x| x.text == 'Manage leave' }
    button.click
  end
  # rubocop:enable Layout/LineLength
end
