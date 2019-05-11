# frozen_string_literal: true

require 'test_helper'

class AirportTest < ActiveSupport::TestCase
  def setup
    @nyc = airports(:nyc)
    @sfo = airports(:sfo)
  end

  test 'airports should contain arriving & departing flights' do
    flights_departing_from_nyc = Flight.all.where(from_airport: @nyc).count
    assert_equal @nyc.departing_flights.count, flights_departing_from_nyc

    flights_arriving_to_nyc = Flight.all.where(to_airport: @nyc).count
    assert_equal @nyc.arriving_flights.count, flights_arriving_to_nyc
  end

  test 'airport cannot be created without a name' do
    atl = Airport.new

    refute atl.save
  end

  test 'airport cannot be created if the name exists already' do
    sfo = Airport.new(name: 'SfO')

    refute sfo.save
  end
end
