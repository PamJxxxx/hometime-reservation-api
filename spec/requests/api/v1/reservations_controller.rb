require 'rails_helper'

RSpec.describe 'Reservations', type: :request do

  let!(:existing_guest) { Guest.create(first_name: 'Abby', last_name: 'Smith', email: 'abby.smith@gmail.com' )}
  let!(:existing_reservation) { Reservation.create(code: 'ABC12345789', guest_id: existing_guest.id )}
  
  let(:airbnb_reservation_attributes) {
    {
      "start_date": "2021-04-14",
      "end_date": "2021-04-18",
      "nights": 4,
      "guests": 4,
      "adults": 2,
      "children": 2,
      "infants": 0,
      "status": "accepted",
      "guest": {
        "first_name": "Wayne",
        "last_name": "Woodbridge",
        "phone": "639123456789",
        "email": "wayne_woodbridge@bnb.com"
      },
      "currency": "AUD",
      "payout_price": "4200.00",
      "security_price": "500",
      "total_price": "4700.00"
    }
  }

  let(:booking_com_reservation_attributes) {
    {
      "start_date": "2021-03-12",
      "end_date": "2021-03-16",
      "expected_payout_amount": "3800.00",
      "guest_details": {
        "localized_description": "4 guests",
        "number_of_adults": 2,
        "number_of_children": 2,
        "number_of_infants": 0
      },
      "guest_email": "wayne_woodbridge@bnb.com",
      "guest_first_name": "Wayne",
      "guest_last_name": "Woodbridge",
      "guest_phone_numbers": ["639123456789", "639123456789"],
      "listing_security_price_accurate": "500.00",
      "host_currency": "AUD",
      "nights": 4,
      "number_of_guests": 4,
      "status_type": "accepted",
      "total_paid_amount_accurate": "4300.00"
    }
  }

  describe 'reservation process' do
    context 'valid attributes - airbnb' do

      subject { post '/api/v1/reservations', params: airbnb_reservation_attributes.merge!({ reservation_code: 'WWW111223435' }), as: :json }

      it 'creates new reservation record from airbnb' do
        expect { subject }.to change { Reservation.count }.by(1)
      end

    end

    context 'valid attributes - bookingcom' do

      subject { post '/api/v1/reservations', params: { reservation: booking_com_reservation_attributes.merge!({ code: 'WWW111223435' }) }, as: :json }

      it 'creates new reservation record from bookingcom' do
        expect { subject }.to change { Reservation.count }.by(1)
      end
    end

    context "invalid attributes" do
      it 'will return a reservation error: code - already been taken' do
        post '/api/v1/reservations', params: airbnb_reservation_attributes.merge!({ reservation_code: existing_reservation[:code] }), as: :json
        expect(JSON.parse(response.body).dig('errors', 'reservations', 'code')[0]).to eq 'has already been taken'
      end

      it 'will return a reservation error: code - already been taken' do
        post '/api/v1/reservations', params: { reservation: booking_com_reservation_attributes.merge!({ code: existing_reservation[:code] }) }, as: :json
        expect(JSON.parse(response.body).dig('errors', 'reservations', 'code')[0]).to eq 'has already been taken'
      end

      it 'will return a schema error' do
        post '/api/v1/reservations', params: { reservation: booking_com_reservation_attributes.merge!({ reservation_code_invalid_key: existing_reservation[:code] }) }, as: :json
        expect(JSON.parse(response.body).dig('errors')).to eq 'Validation error in: Schema'
      end
    end

    context "reservation update" do
      it 'updates an existing reservation record' do
        airbnb_reservation_attributes[:guest][:email] = existing_guest[:email]
        airbnb_reservation_attributes[:guests] = 5

        post '/api/v1/reservations', params: airbnb_reservation_attributes.merge!({ reservation_code: existing_reservation[:code], guest_id: existing_guest[:id] }), as: :json
        expect(JSON.parse(response.body)['reservation'][0]['number_of_guests']).to eq 5
      end
    end
  end
end
