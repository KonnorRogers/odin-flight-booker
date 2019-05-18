# frozen_string_literal: true

require 'test_helper'

class FlightSearchTest < ActionDispatch::IntegrationTest
  def setup
    @now = flights(:one)
    @before_now = flights(:two)
    @after_now = flights(:three)
    @sfo = airports(:sfo)
    @nyc = airports(:nyc)
  end

  test 'should return two flights' do
    get root_url

    get flights_path, params: {
      to_airport: @now.to_airport.id,
      from_airport: @now.from_airport.id,
      start: Flight.formatted_date(@now.start)
    }

    # p Flight.available(@now.to_airport_id,
    #                  @now.from_airport_id,
    #                  Flight.formatted_date(Time.zone.now)).first




    start = Flight.formatted_date(Time.zone.now)

    p Flight.where("start >= :begin and start <= :ending",
                   begin: Flight.beginning(start),
                   ending: Flight.ending(start))

    p Time.zone.now
    p Flight.beginning(start)
    p Flight.ending(start)

    to = @now.to_airport.id
    from = @now.from_airport.id

    p Flight.where(["to_airport_id = :to and
                                    from_airport_id = :from and
                                    start >= :begin and
                                    start <= :ending",
                    { to: to,
                      from: from,
                      begin: Flight.beginning(start),
                      ending: Flight.ending(start) }])

    assert_response :success
  end
end
