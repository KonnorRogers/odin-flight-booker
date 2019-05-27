# frozen_string_literal: true

class BookingsController < ApplicationController
  def new
    @booking ||= Flight.find_by(id: params[:flight]).bookings.build

    @num_passengers = params[:num_passengers]

    @num_passengers.to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      flash[:info] = 'booking confirmed'
      redirect_to booking_path(@booking)
    else
      flash[:error] = 'Uh oh, something went wrong!'
      flash[:info] = "#{@booking.errors.full_messages}"
      render 'new'
    end
  end

  def show
    @booking = Booking.find(params[:id])
    @flight = @booking.flight
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[id name email])
  end
end
