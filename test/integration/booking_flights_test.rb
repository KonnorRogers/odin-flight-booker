require 'test_helper'

class BookingFlightsTest < ActionDispatch::IntegrationTest
  def setup
    @booking = bookings(:one)
  end

  test 'should create a booking object with 2 passengers' do
    get root_url
    # p @booking.passengers
  end
end
