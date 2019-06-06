# Preview all emails at http://localhost:3000/rails/mailers/passenger_mailer
class PassengerMailerPreview < ActionMailer::Preview
  def thank_you_emails
    PassengerMailer.with(booking: Booking.first).thank_you_emails
  end
end
