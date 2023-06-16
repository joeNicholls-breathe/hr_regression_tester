require File.expand_path('../base.rb', __FILE__)

class AccountWorkingPatternExtension < Base
  def working_pattern_add
    driver.find_element(css: 'href="/account_working_patterns/new"').click
    driver.find_element(id: 'working_pattern_name').sendkeys "Reggression Add Working Pattern"
    driver.find_element(id: 'working_pattern_mon_hr_hours').sendkeys "7"
    driver.find_element(id: 'working_pattern_mon_hr_minutes').sendkeys "30"
    driver.find_element(id: 'working_pattern_tue_hr_hours').sendkeys "7"
    driver.find_element(id: 'working_pattern_tue_hr_minutes').sendkeys "30"
    driver.find_element(id: 'working_pattern_wed_hr_hours').sendkeys "7"
    driver.find_element(id: 'working_pattern_wed_hr_minutes').sendkeys "30"
    driver.find_element(id: 'working_pattern_thu_hr_hours').sendkeys "7"
    driver.find_element(id: 'working_pattern_thu_hr_minutes').sendkeys "30"
    driver.find_element(id: 'working_pattern_fri_hr_hours').sendkeys "7"
    driver.find_element(id: 'working_pattern_fri_hr_minutes').sendkeys "30"
    driver.find_element(id: 'working_pattern_sat_hr_hours').sendkeys "7"
    driver.find_element(id: 'working_pattern_sat_hr_minutes').sendkeys "30"
    driver.find_element(id: 'working_pattern_sun_hr_hours').sendkeys "7"
    driver.find_element(id: 'working_pattern_sun_hr_minutes').sendkeys "30"
    driver.find_element(xpath: '//*[@id="new_working_pattern"]/p/input').click
  end

  def working_pattern_set_new_default
    drop = driver.find_element(id:'account_working_pattern_id')
    choose = Selenium::WebDriver::Support::Select.new(drop)
    choose.select_by(:value, "3936")
    driver.find_element(xpath: '/html/body/section[2]/form[2]/div/div[2]/input').click
  end

  def working_pattern_edit
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr/td[5]/a[1]/svg').click
    driver.find_element(id: 'working_pattern_sun_hr_hours').sendkeys "10"
    driver.find_element(xpath: '//*[@id="edit_working_pattern"]/p/input').click
  end

  def working_pattern_delete
    driver.find_element(xpath: '//*[@id="DataTables_Table_0"]/tbody/tr[2]/td[5]/svg/path').click
    driver.find_element(xpath: '//*[@id="delete_pattern"]/div/div/div[3]/button[2]:').click
  end

  def working_pattern_search
    driver.find_element(xpath: '//*[@id="DataTables_Table_0_filter"]/label/input').sendkeys "Auto Regression"
    sleep 1
  end

  def working_pattern_show_inactive
    driver.find_element(id: 'show-inactive-patterns').click
  end
end
