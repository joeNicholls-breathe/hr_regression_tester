# frozen_string_literal: true

require File.expand_path('base.rb', __dir__)
require 'date'

module TestRefExtension
  def random_number_string
    Random.new.rand(0..1000).to_s
  end

  def todays_date
    Time.zone.today
  end

  def todays_date_string
    Time.zone.today.strftime('%d-%m-%Y')
  end

  def tomorrow
    Time.zone.today + 1
  end
end
