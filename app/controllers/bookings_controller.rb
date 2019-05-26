class BookingsController < ApplicationController
  def new
    @flight_id = params[:flight].id
    @num_passengers = params[:num_passengers]

    @passengers = []
    @num_passenger.times { @passengers << Passenger.new }
  end

  def create
  end

  def show
  end

  private

  def booking_params
    params.require(:booking).permit(:flight, :num_passengers)
  end
end
