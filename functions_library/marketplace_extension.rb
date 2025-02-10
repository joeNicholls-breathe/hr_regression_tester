# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class MarketPlaceExtension < Base
  def navigate_to_marketplace
    driver.find_element(css: '#top-menu-menu-item-2-9').click
  end

  def open_marketplace_widget(target_href)
    widgets = driver.find_elements(class: 'find-more')
    target = "https://hr.breathehrstaging.com/marketplace/#{target_href}"
    widget = widgets.find { |w| w.attribute('href') == target }
      widget.click
    puts "PASS - #{target_href} opened"
  end

  def check_page_title(expected_title)
    title = driver.find_element(css: 'body > div.hr-main-container > div > section > h1').text
    if expected_title == title
      puts 'PASS - Correct Page Loaded'
    else 
      puts 'FAIL - Incorrect Title - May be wrong page'
    end
    driver.find_element(css: 'body > div.hr-main-container > div > section > div.breadcrumb > a').click
  end
end
