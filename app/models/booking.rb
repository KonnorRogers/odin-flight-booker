class Booking < ApplicationRecord
  has_many :passengers
  has_one :flight
end
