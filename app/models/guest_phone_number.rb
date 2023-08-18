class GuestPhoneNumber < ApplicationRecord
  
  belongs_to :guest

  validates :phone_number, format: { with: /\A\d+\z/, message: "Invalid phone number format" }
end
