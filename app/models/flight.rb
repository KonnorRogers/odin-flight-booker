# frozen_string_literal: true

class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: 'Airport'
  belongs_to :to_airport, class_name: 'Airport'

  validates :from_airport, presence: true
  validates :to_airport, presence: true

  scope :available, lambda { |to, from, start|
                      Flight.where(["to_airport_id = :to and
                                    from_airport_id = :from and
                                    start = :start",
                                    { to: to,
                                      from: from,
                                      start: start }])
                    }

  scope :test, ->(start) { Flight.where("start > ?", start) }

  scope :dates, -> { Flight.where('start > ?', Time.zone.now) }

  def self.start_dates
    Flight.dates
  end

  def start_dates_formatted
    start.strftime("%m/%d/%Y  Time: %H:%M")
  end
end
