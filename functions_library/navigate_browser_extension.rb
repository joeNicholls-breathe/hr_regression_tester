# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)
require 'Benchmark'

class NavigateBrowserExtension < Base
  def breathe_login_with_timer
    timer = Benchmark.measure do
      driver.navigate.to('https://login.breathehrstaging.com/login')
      puts 'Test Navigate to URl'
    end
    puts timer.total * 1000

    return unless timer.total > 3

    puts 'URL load time over performance requirement'
  end

  def breathe_signup
    driver.navigate.to('https://hr.breathehrstaging.com/signup')
  end

  def cookie_modal_accept
    driver.find_element(id: 'CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll').click
  end

  def breathe_login
    driver.navigate.to('https://login.breathehrstaging.com/login')
  end

  def breathe_signup_buy_now
    driver.navigate.to('https://hr.breathehrstaging.com/signup?type=buy-now')
  end
end
