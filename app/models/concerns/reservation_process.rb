module ReservationProcess

  extend ActiveSupport::Concern

  class_methods do
    def begin_transaction(params)
      reservation_attr = reservation_attributes(params)
      guest_attr       = guest_attributes(params)
      reservation      = self.find_by(code: reservation_attr[:code])
  
      ActiveRecord::Base.transaction do
        guest       = Guest.find_or_initialize_by(email: guest_attr[:email])
        reservation = guest.reservations.find_or_initialize_by(code: reservation_attr[:code])
  
        reservation.attributes = reservation_attr
        reservation.guest.attributes = guest_attr
  
        reservation.save
        reservation
      end
    rescue => error
      reservation.errors.add(:base, 'Error occurs upon saving a reservation. Please contact support')
      reservation
    end
  end
end