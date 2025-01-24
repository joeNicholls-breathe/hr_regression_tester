# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)
require 'active_support/isolated_execution_state'
require 'active_support/time'
require 'date'
require 'Time'

module TestRefExtension
  def random_number_string
    Random.new.rand(0..1000).to_s
  end

  def todays_date
    Time.now.utc
  end

  def todays_date_string
    Time.now.utc.strftime('%d/%m/%Y')
  end

  def yesterday
    yesterday = todays_date - 1.day
    yesterday.strftime('%d/%m/%Y')
  end

  def three_days_ago
    yesterday = todays_date - 3.days
    yesterday.strftime('%d/%m/%Y')
  end

  def todays_date_string_slash
    Time.now.utc.strftime('%d/%m/%Y')
  end

  def tomorrow
    tomorrow = todays_date + 1.day
    tomorrow.strftime('%d/%m/%Y')
  end

  def one_week_date_string
    oneweek = todays_date + 7.days
    oneweek.strftime('%d/%m/%Y')
  end

  def one_week_one_day_string
    oneweek = todays_date + 8.days
    oneweek.strftime('%d/%m/%Y')
  end

  def one_week_ago_string
    weekago = todays_date - 7.days
    weekago.strftime('%d/%m/%Y')
  end

  def two_week_date_string
    twoweeks = todays_date + 14.days
    twoweeks.strftime('%d/%m/%Y')
  end

  def sixteen_days_date_string
    sexteendays = todays_date + 16.days
    sexteendays.strftime('%d/%m/%Y')
  end

  def one_month
    todays_date + 30.days
  end

  def one_month_date_string
    one_month = todays_date + 30.days
    one_month.strftime('%d/%m/%Y')
  end

  def one_year_date_string
    one_year = todays_date + 1.year
    one_year.strftime('%d/%m/%Y')
  end

  def five_year_date_string
    five_year = todays_date + 5.years
    five_year.strftime('%d/%m/%Y')
  end
end
