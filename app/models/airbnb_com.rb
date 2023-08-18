class AirbnbCom < Reservation
  
  include ReservationProcess

  JSON_SCHEMA = Pathname.new("#{Rails.root}/app/models/schemas/airbnb_com.json")

  private

  def self.reservation_attributes(params)
    {
      code:               params[:reservation_code],
      start_date:         params[:start_date],
      end_date:           params[:end_date],
      payout_price:       params[:payout_price],
      security_price:     params[:security_price],
      currency:           params[:currency],
      number_of_nights:   params[:nights],
      number_of_guests:   params[:guests],
      status:             params[:status],
      total_price:        params[:total_price],
      number_of_adults:   params[:adults],
      number_of_children: params[:children],
      number_of_infants:  params[:infants]
    }
  end

  def self.guest_attributes(params)
    {
      first_name: params[:guest][:first_name],
      last_name:  params[:guest][:last_name],
      email:      params[:guest][:email],
    }
  end
end