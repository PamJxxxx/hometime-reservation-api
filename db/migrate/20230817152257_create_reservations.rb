class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :guest
      
      t.string  :code
      t.date    :start_date
      t.date    :end_date
      t.decimal :payout_price,   precision: 10, scale: 2
      t.decimal :security_price, precision: 10, scale: 2
      t.string  :currency
      t.integer :number_of_nights
      t.integer :number_of_guests
      t.string  :status
      t.decimal :total_price,    precision: 10, scale: 2
      t.integer :number_of_adults
      t.integer :number_of_children
      t.integer :number_of_infants
      t.string  :localized_description
      t.timestamps
    end
  end
end
