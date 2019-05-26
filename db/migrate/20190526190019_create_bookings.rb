class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.timestamps
    end

    add_foreign_key :bookings, :passengers
  end
end
