class FlightsController < ApplicationController
  def index
    # Creates an array of arrays for use by options for select
    @airport_options = Airport.all.map { |a| [ a.name, a.id ] }
    @flight = Flight.new
  end
end
