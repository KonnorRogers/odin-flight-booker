# frozen_string_literal: true

class PassengerMailer < ApplicationMailer
  default from: 'flights@paramagicflights.com'

  def thank_you_emails
    @booking = params[:booking]
    @url = booking_url(@booking)

    @booking.passengers.each do |passenger|
      @passenger = passenger
      mail(to: @passenger.email,
           subject: 'Thank you for booking your flight')
    end
  end
end
