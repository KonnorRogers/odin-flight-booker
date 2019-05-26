class Passenger < ApplicationRecord
  has_many :bookings
  # uses a through model because the booking contains the info
  # for the flight
  has_many :flights, through: :bookings

  validates :name, presence: true
  validates :email, presence: true
end
