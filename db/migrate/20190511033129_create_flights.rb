class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.datetime :start
      t.time :duration

      t.timestamps
    end

    add_index :flights, :departing_airport_id
    add_index :flights, :arriving_airport_id
  end
end
