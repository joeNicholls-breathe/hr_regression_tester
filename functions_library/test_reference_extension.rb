# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)
require 'date'
require 'Time'

module TestRefExtension
  def random_number_string
    Random.new.rand(0..1000).to_s
  end

  def todays_date
    Date.today
  end

  def todays_date_string
    Date.today.strftime('%d-%m-%Y')
  end

  def tomorrow
    Date.today + 1
  end

  def one_week_date_string
    tomorrow = Date.today + 7
    tomorrow.strftime('%d/%m/%Y')
  end

  def one_month
    Date.today + 30
  end

  def one_month_date_string
    one_month = Date.today + 30
    one_month.strftime('%d/%m/%Y')
  end

end
