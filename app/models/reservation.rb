class Reservation < ApplicationRecord
  belongs_to :guest

  validates :code, presence: true, uniqueness: { case_sensitive: false }

  def self.subklasses
    [AirbnbCom, BookingCom]
  end
end
