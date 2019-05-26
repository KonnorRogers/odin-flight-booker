require 'test_helper'

class FlightTest < ActiveSupport::TestCase
  def setup
    @now = flights(:one)
    @before_now = flights(:two)
    @after_now = flights(:three)
    @sfo = airports(:sfo)
    @nyc = airports(:nyc)
    # @date_format =
  end

  test 'flight should contain arriving and departing airport' do
    assert_equal @now.from_airport, @nyc
    assert_equal @now.to_airport, @sfo
  end

  test 'flight cannot be created without a from and to airport' do
    @now.to_airport = nil
    refute @now.save

    @now.to_airport = @sfo
    @now.from_airport = nil

    refute @now.save
  end

  test 'should only return flights after today' do
    assert_includes Flight.dates, @now, @after_now
    refute_includes Flight.dates, @before_now
  end

  test 'should only return after_now flight' do
    assert_includes Flight.available(@after_now.to_airport_id,
                                     @after_now.from_airport_id,
                                     Flight.formatted_date(@after_now.start)), @after_now
  end

  test 'should return a date list' do
    # because date_list is an array of arrays, we must flatten it first
    assert_includes Flight.date_list.flatten,
      Flight.formatted_date(@now.start),
      Flight.formatted_date(@after_now.start)

    refute_includes Flight.date_list, Flight.formatted_date(@before_now.start)

  end

  test 'should return date in format %m/%d/%Y' do
    assert_equal Flight.formatted_date(Time.zone.now),
                 Time.zone.now.strftime('%m/%d/%Y')
  end

  test 'should parse dates in %m/%d/%y format properly' do
    date = Flight.formatted_date(Time.zone.now)

    assert_nil Flight.parse(nil)
    assert_nil Flight.parse('invalid date')
  end
end
