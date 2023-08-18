class Reservation < ApplicationRecord

  belongs_to :guest

  validates :code, presence: true, uniqueness: { case_sensitive: false }
  
  def self.inakay
    [AirbnbCom, BookingCom]
  end
end
