require 'selenium-webdriver'

class Extension
    attr_accessor :driver
    def initialize(driver)
         @driver = driver
    end

    def bulk_upload__name
        driver.find_element(css:'#navbar-nav-dropdown > ul > li:nth-child(3)').click
        driver.find_element(css:'#navbar-nav-dropdown a:nth-child(4)').click
        # #navbar-nav-dropdown > ul > li.nav-item.dropdown.show > div > a:nth-child(4)
        driver.find_element(css:'body > section.content.container > div:nth-child(4) > div:nth-child(1) > div:nth-child(1) > a').click
        driver.find_element(css:'body > section.content.container > div.float-right > a').click
        driver.find_element(id:'employees_data_import_type').click
        drop = driver.find_element(id:'employees_data_import_type')
        choose.select_by(value:'employee_basic')
        driver.find_element(id:'employees_data_import_import').send_keys "document.xls"
        driver.find_element(id:'submit-import').click
    end

    private 

    attr_reader :driver
end



