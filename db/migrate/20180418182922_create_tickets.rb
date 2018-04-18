class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.integer :booking_id
      t.integer :passenger_id

      t.timestamps
    end
    
    add_foreign_key :tickets, :bookings
    add_foreign_key :tickets, :passengers
  end
end
