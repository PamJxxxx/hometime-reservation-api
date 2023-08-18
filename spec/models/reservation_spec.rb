require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let!(:guest) { Guest.create(email: 'test@gmail.com', first_name: 'Test', last_name: 'Gmail')}
  let!(:reservation) { 
    Reservation.create(code: Array.new(10){[*"A".."Z", *"0".."9"].sample}.join, guest_id: guest.id)
   }

  subject { 
    described_class.new(
      start_date: '2022-11-20',
      end_date: '2022-11-23',
      payout_price: '400.00',
      guest_id: guest.id
    )
  }
  
  describe 'validations' do
    it 'is valid with valid attributes' do
      subject.code = Array.new(10){[*"A".."Z", *"0".."9"].sample}.join
      expect(subject).to be_valid
    end
    it 'is invalid with blank code' do
      subject.code = ''
      expect(subject).to be_invalid
    end
    it 'is invalid with existing code' do
      subject.code = reservation.code
      expect(subject).to be_invalid
    end
  end

  describe 'associations' do
    it { should belong_to(:guest) }
  end

  describe 'subclasses' do
    it 'has subclasses AirbnbCom and BookingCom' do
      expect(described_class.subklasses).to eq [AirbnbCom, BookingCom]
    end
  end
end
