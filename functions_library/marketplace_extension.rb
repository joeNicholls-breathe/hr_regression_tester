# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class MarketPlaceExtension < Base
  def navigate_to_marketplace
    driver.find_element(css: '#top-menu-menu-item-1-8').click
  end

  def open_marketplace_widget(target_href)
    widgets = driver.find_elements(class: 'find-more')
    target = "https://hr.breathehrstaging.com/marketplace/#{target_href}"
    widget = widgets.find { |w| w.attribute('href') == target }
    widget.click
  end

  def page_title(_expected_title)
    driver.find_element(css: 'body > div.hr-main-container > div > section > h1').text
  end
end
