# frozen_string_literal: true

class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: 'Airport'
  belongs_to :to_airport, class_name: 'Airport'

  validates :from_airport, presence: true
  validates :to_airport, presence: true

  scope :available, lambda { |to, from, start|
                      Flight.where(["to_airport_id = :to and
                                    from_airport_id = :from and
                                    start >= :begin and
                                    start <= :ending",
                                    { to: to,
                                      from: from,
                                      begin: beginning(start),
                                      ending: ending(start) }])
                    }

  scope :dates, -> { Flight.where('start > ?', Time.zone.now) }
  scope :in_order, -> { Flight.all.order(start: :asc) }

  def self.date_list
    dates = Flight.dates.in_order
    dates.map { |d| [d.start] }.uniq
  end

  def self.beginning(date)
    return if date.nil?

    Date.parse(date).beginning_of_day
  end

  def self.ending(date)
    return if date.nil?

    Date.parse(date).end_of_day
  end
end
