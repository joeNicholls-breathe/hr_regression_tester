# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)

class AppNavigationExtensionFinance < Base
  def finance_dashboard
    driver.find_element(css: '').click
  end
end
