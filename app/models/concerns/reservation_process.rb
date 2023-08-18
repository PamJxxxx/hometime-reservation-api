module ReservationProcess
  extend ActiveSupport::Concern

  class_methods do
    def begin_transaction(params)
      @params = params

      ActiveRecord::Base.transaction do
        guest = Guest.find_or_initialize_by(email: guest_attributes[:email])
        reservation = guest.reservations.find_or_initialize_by(code: reservation_attributes[:code])
        reservation.attributes = reservation_attributes

        guest.reservations << reservation
        guest.attributes = guest_attributes

        guest.save
        guest
      end
    rescue StandardError => _e
      guest.errors.add(:base, 'Error occurs upon saving a reservation. Please contact support')
    end
  end
end
