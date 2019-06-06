class PassengerMailer < ApplicationMailer
  default from: 'konnor@example.com'

  def thank_you_email
    # @user = params[:user]
    # @url = 'http://example.com'
    # mail(to: @user.email, subject: "Thank you for purchasing your ticket")
  end
end
