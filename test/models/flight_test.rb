require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  def setup
    @one = flights(:one)
    @sfo = airports(:sfo)
    @nyc = airports(:nyc)
  end

  test 'flight should contain arriving and departing airport' do
    assert_equal @one.from_airport, @nyc
    assert_equal @one.to_airport, @sfo
  end

  test 'flight cannot be created without a from and to airport' do
    @one.to_airport = nil
    refute @one.save

    @one.to_airport = @sfo
    @one.from_airport = nil

    refute @one.save
  end
end
