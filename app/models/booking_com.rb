class BookingCom < Reservation
  include ReservationProcess

  JSON_SCHEMA = Pathname.new("#{Rails.root}/app/models/schemas/booking_com.json")

  def self.reservation_attributes
    attrs = @params[:reservation]

    {
      code: attrs[:code],
      start_date: attrs[:start_date],
      end_date: attrs[:end_date],
      payout_price: attrs[:expected_payout_amount],
      security_price: attrs[:listing_security_price_accurate],
      currency: attrs[:host_currency],
      number_of_nights: attrs[:nights],
      number_of_guests: attrs[:number_of_guests],
      status: attrs[:status_type],
      total_price: attrs[:total_paid_amount_accurate],
      number_of_adults: attrs[:guest_details][:number_of_adults],
      number_of_children: attrs[:guest_details][:number_of_children],
      number_of_infants: attrs[:guest_details][:number_of_infants],
      localized_description: attrs[:guest_details][:localized_description]
    }
  end

  def self.guest_attributes
    guest_detail = @params[:reservation]

    {
      first_name: guest_detail[:guest_first_name],
      last_name: guest_detail[:guest_last_name],
      email: guest_detail[:guest_email]
    }
  end
end
