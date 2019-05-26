class Booking < ApplicationRecord
  has_many :passengers
  belongs_to :flight
end
