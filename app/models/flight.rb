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
    dates.map { |d| [formatted_date(d.start)] }.uniq
  end

  def self.formatted_date(date)
    return if date.nil?

    date = date.to_date
    date.strftime("%m/%d/%Y")
  end

  def self.parse(date)
    return if date.nil? || date.empty?

    Time.zone.strptime(date.to_s, '%m/%d/%y')
  end

  def self.beginning(date)
    parse(date).beginning_of_day unless date.nil? || date.blank?
  end

  def self.ending(date)
    parse(date).end_of_day unless date.nil? || date.blank?
  end
end
