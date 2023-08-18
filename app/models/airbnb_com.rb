class AirbnbCom < Reservation
  include ReservationProcess

  JSON_SCHEMA = Pathname.new("#{Rails.root}/app/models/schemas/airbnb_com.json")

  def self.reservation_attributes
    {
      code: @params[:reservation_code],
      start_date: @params[:start_date],
      end_date: @params[:end_date],
      payout_price: @params[:payout_price],
      security_price: @params[:security_price],
      currency: @params[:currency],
      number_of_nights: @params[:nights],
      number_of_guests: @params[:guests],
      status: @params[:status],
      total_price: @params[:total_price],
      number_of_adults: @params[:adults],
      number_of_children: @params[:children],
      number_of_infants: @params[:infants]
    }
  end

  def self.guest_attributes
    {
      first_name: @params[:guest][:first_name],
      last_name: @params[:guest][:last_name],
      email: @params[:guest][:email]
    }.merge(phone_number_attributes)
  end

  def self.phone_number_attributes
    {
      guest_phone_numbers_attributes: [
        {
          phone_number: @params[:guest][:phone]
        }
      ]
    }
  end
end
