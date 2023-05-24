require File.expand_path('../base.rb', __FILE__)
require 'date'

module TestRefExtension
    def random_number_string
      Random.new.rand(0..100).to_s
    end

    def todays_date
      Date.today
    end

    def tomorrow
      Date.today + 1
    end
end
