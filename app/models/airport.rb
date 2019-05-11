class Airport < ApplicationRecord
  has_many :departing_flights, class_name: 'Flight',
                               foreign_key: 'departing_flights_id',
                               dependent: :destroy

  has_many :arriving_flights, class_name: 'Flight',
                              foreign_key: 'arriving_flights_id',
                              dependent: :destroy
end
