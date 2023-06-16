require File.expand_path('../base.rb', __FILE__)

class AccountHolidayAllowanceExtension < Base
	def holiday_allowances_add
    driver.find_element(css: 'href="/account_holiday_allowances/new"').click
    driver.find_element(id: 'holiday_allowance_title').sendkeys "Regression Test DATE TODAY"
    driver.find_element(id: 'holiday_allowance_flat_quantity').sendkeys "25"
    driver.find_element(id: 'holiday_allowance_carryover_true').click
    driver.find_element(id: 'holiday_allowance_max_use_by_end').sendkeys "5"
    driver.find_element(id: 'holiday_allowance_months_range_from_end').sendkeys "3"
    driver.find_element(id: 'holiday_allowance_allow_negative_true').click
    driver.find_element(id: 'holiday_allowance_max_negative').sendkeys "5"
    driver.find_element(xpath: '//*[@id="new_holiday_allowance"]/p/input').click
  end

  def holiday_allowances_edit
    driver.find_element(css: 'href="/account_holiday_allowances/3974/edit"').click
    driver.find_element(id: 'holiday_allowance_flat_quantity').sendkeys "21"
    driver.find_element(css: 'value="update allowance"').click
  end

  def holiday_allowances_select_default
    drop = driver.find_element(id:'id="account_holiday_allowance_id"')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, "3974")
    driver.find_element(xpath: '/html/body/section[2]/form[2]/div/div[2]/input').click
  end

  def holiday_allowances_delete
    driver.find_element(css: 'data-icon="trash-alt"').click
    driver.find_element(css: 'class="btn btn-danger modal-confirm').click
  end
end
