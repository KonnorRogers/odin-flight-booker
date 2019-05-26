class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.belongs_to :flight, index: true
      t.belongs_to :passenger, index: true

      t.timestamps
    end
  end
end
