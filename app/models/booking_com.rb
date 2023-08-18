class BookingCom < Reservation

  include ReservationProcess
  
  JSON_SCHEMA = Pathname.new("#{Rails.root}/app/models/schemas/booking_com.json")

  private

  def self.reservation_attributes(params)
    params = params[:reservation]

    {
      code:                  params[:code],
      start_date:            params[:start_date],
      end_date:              params[:end_date],
      payout_price:          params[:expected_payout_amount],
      security_price:        params[:listing_security_price_accurate],
      currency:              params[:host_currency],
      number_of_nights:      params[:nights],
      number_of_guests:      params[:number_of_guests],
      status:                params[:status_type],
      total_price:           params[:total_paid_amount_accurate],
      number_of_adults:      params[:guest_details][:number_of_adults],
      number_of_children:    params[:guest_details][:number_of_children],
      number_of_infants:     params[:guest_details][:number_of_infants],
      localized_description: params[:guest_details][:localized_description],
    }
  end

  def self.guest_attributes(params)
    params = params[:reservation]
    
    {
      first_name: params[:guest_first_name],
      last_name:  params[:guest_last_name],
      email:      params[:guest_email],
    }
  end
end
