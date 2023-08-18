class CreateGuestPhoneNumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :guest_phone_numbers do |t|

      t.references :guest

      t.string :phone_number
      t.timestamps
    end
  end
end
