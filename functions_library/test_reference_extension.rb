require File.expand_path('../base.rb', __FILE__)
require 'date'

class TestRefExtension < Base
    def test_reference_admin_signup
      testref_string = Random.new.rand(0..100)
    end

    def todays_date
      Date.today
    end

    def tomorrow
      Date.today + 1
    end
end
