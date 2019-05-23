# frozen_string_literal: true

require 'test_helper'

class FlightSearchTest < ActionDispatch::IntegrationTest
  def setup
    @now = flights(:one)
    @before_now = flights(:two)
    @after_now = flights(:three)
  end

  test 'should return one flight' do
    get root_url

    get flights_path, params: {
      to_airport: @now.to_airport.id,
      from_airport: @now.from_airport.id,
      start: Flight.formatted_date(@now.start)
    }

    flights = controller.instance_variable_get(:@flights)

    assert_includes flights, @now
    refute_includes flights, @after_now, @before_now
  end
end
