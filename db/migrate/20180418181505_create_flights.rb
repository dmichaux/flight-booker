class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.datetime :departing_time
      t.integer :duration
      t.integer :available_seat_count
      t.integer :from_airport_id
      t.integer :to_airport_id

      t.timestamps
    end

    add_foreign_key :flights, :airports, column: :from_airport_id
    add_foreign_key :flights, :airports, column: :to_airport_id
  end
end
