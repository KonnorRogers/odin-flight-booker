require 'test_helper'

class BookingFlightsTest < ActionDispatch::IntegrationTest
  def setup
    @sfo = airports(:sfo)
    @nyc = airports(:nyc)
    @flight = flights(:one)
    @booking = bookings(:one)
    @konnor = passengers(:konnor)
  end

  test 'should create a booking object with 2 passengers' do
    get root_url
    assert_response :success

    get flights_url, params: {
      to_airport: @sfo,
      from_airport: @nyc,
      start: Flight.formatted_date(Time.zone.now)
    }

    assert_response :success

    get new_booking_url, params: {
      num_passengers: 1,
      flight: @flight.id
    }

    assert_response :success

    assert_difference 'Booking.count', 1 do
      post bookings_path(@booking), params: {
        booking: {
          passenger: @konnor
        }
      }
    end
  end
end
