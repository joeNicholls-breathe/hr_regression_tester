require_relative 'base_performance_test'
require_relative '../functions_library/holiday_extension'

RSpec.describe 'Holiday Performance Tests' do
  before(:each) do
    @performance_test = BasePerformanceTest.new(@driver)
    @holiday_extension = HolidayExtension.new(@driver)
  end

  it 'measures performance of holiday request process' do
    execution_time = @performance_test.measure_execution_time do
      @holiday_extension.login_as_employee('test_user', 'password')
      @holiday_extension.request_holiday('2025-04-15', '2025-04-20')
      @holiday_extension.logout
    end

    expect(execution_time).to be < 5 # Example threshold in seconds
  end
end