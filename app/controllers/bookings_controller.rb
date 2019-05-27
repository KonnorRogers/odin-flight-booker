# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    @flight = Flight.find_by(id: params[:flight])

    unless @flight
      flash[:danger] = 'No flight found'
      redirect_to root_url
      return
    end

    @num_passengers = params[:num_passengers]
    @booking = @flight.bookings.build

    @passengers = @num_passengers.to_i.times.map { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(passenger_attributes: %i[id name email])
  end
end
