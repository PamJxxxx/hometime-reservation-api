module ReservationProcess
  extend ActiveSupport::Concern

  class_methods do
    def begin_transaction(params)
      @params = params

      ActiveRecord::Base.transaction do
        guest       = Guest.find_or_initialize_by(email: guest_attributes[:email])
        reservation = guest.reservations.find_or_initialize_by(code: reservation_attributes[:code])
        reservation.attributes = reservation_attributes
        guest.reservations << reservation
        guest.attributes = assess_guest_attributes(guest)
        guest.save
        guest
      end
    rescue StandardError => _e
      guest.errors.add(:base, 'Error occurs upon saving a reservation. Please contact support')
    end

    private

    def assess_guest_attributes(guest)
      temp_guest_attributes = guest_attributes
      guest_attributes[:guest_phone_numbers_attributes].each_with_index do |attrs, index|
        phone_number_record = guest.guest_phone_numbers.find_by(phone_number: attrs[:phone_number])
        if phone_number_record.present?
          temp_guest_attributes[:guest_phone_numbers_attributes][index][:id] =
            phone_number_record.id
        end
      end
      temp_guest_attributes
    end
  end
end
