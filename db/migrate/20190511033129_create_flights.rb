class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.datetime :start
      t.integer :duration
      t.integer :to_airport_id
      t.integer :from_airport_id

      t.timestamps
    end

    add_index :flights, :from_airport_id
    add_index :flights, :to_airport_id
  end
end
