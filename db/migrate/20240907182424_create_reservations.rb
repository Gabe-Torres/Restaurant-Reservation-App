class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.string :name
      t.integer :party_size
      t.datetime :reservation_time

      t.timestamps
    end
  end
end
