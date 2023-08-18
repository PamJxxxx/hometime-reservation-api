class Guest < ApplicationRecord
  has_many :reservations
  has_many :guest_phone_numbers

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  accepts_nested_attributes_for :guest_phone_numbers, reject_if: lambda { |attributes|
                                                                   attributes['phone_number'].blank?
                                                                 }, allow_destroy: true
end
