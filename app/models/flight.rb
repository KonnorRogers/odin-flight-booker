# frozen_string_literal: true

class Flight < ApplicationRecord
  belongs_to :from_airport, class_name: 'Airport'
  belongs_to :to_airport, class_name: 'Airport'

  validates :from_airport, presence: true
  validates :to_airport, presence: true

  attr_reader :date_str_format
  @date_str_format = "%m/%d/%Y"

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

  scope :dates, lambda { |date = Time.zone.now|
                  Flight.where('start >= ?',
                               date.beginning_of_day)
                }
  scope :in_order, -> { Flight.all.order(start: :asc) }

  def self.date_list
    dates = Flight.dates.in_order
    dates.map { |d| [formatted_date(d.start)] }.uniq
  end

  def self.formatted_date(date)
    return if date.nil?

    date = date.to_date
    date.strftime(@date_str_format)
  end

  # @param date [String] Date formatted in %m/%d/%y format
  def self.parse(date)
    Date.strptime(date.to_s, @date_str_format)
  rescue
      puts "Invalid date provided"
  end

  def self.beginning(date)
    date = parse(date)

    return if date.nil?

    date.beginning_of_day
  end

  def self.ending(date)
    date = parse(date)

    return if date.nil?

    date.end_of_day
  end
end
