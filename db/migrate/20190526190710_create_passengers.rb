class CreatePassengers < ActiveRecord::Migration[5.2]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.belongs_to :booking

      t.timestamps
    end
  end
end
