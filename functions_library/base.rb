require 'selenium-webdriver'
require_relative '../settings.rb'
require 'pry'

class Base
  include Settings

  attr_accessor :driver

  def initialize(driver)
    @driver = driver
  end
end
