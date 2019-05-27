# frozen_string_literal: true

class FlightsController < ApplicationController
  def index
    # Creates an array of arrays for use by options for select
    @airport_options = Airport.all.map { |a| [a.name, a.id] }
    @passengers = %w[1 2 3 4]

    @dates = Flight.date_list
    @flights = Flight.available(params[:to_airport],
                                params[:from_airport],
                                params[:start])
  end

  private

  def flight_params
    params.require(:flight).permit(:to_airport, :from_airport,
                                   :passengers, :start, :id)
  end
end
