class Airport < ApplicationRecord
  has_many :departing_flights, class_name: 'Flight',
                               foreign_key: 'from_airport_id',
                               dependent: :destroy,
                               source: :from_airport

  has_many :arriving_flights, class_name: 'Flight',
                              foreign_key: 'to_airport_id',
                              dependent: :destroy,
                              source: :to_airport

  # has_many :arriving_flights, through: :arriving_flights, source: :to_airport
  # has_many :departing_flights, through: :departing_flights, source: :from_airport
end
