require 'rails_helper'

RSpec.describe GuestPhoneNumber, type: :model do
  let(:guest) { Guest.create(email: 'testuser@gmail.com') }

  subject { 
    described_class.new(
      guest_id: guest.id
    )
  }

  describe 'validations' do
    it 'is valid with valid attributes' do
      subject.phone_number = '12094023959'
      expect(subject).to be_valid
    end
  
    it 'is not valid without an phone_number' do
      subject.phone_number = ''
      expect(subject).to be_invalid
    end
  
    it 'is not valid with an invalid phone_number format' do
      subject.phone_number = '6346dfrgyrdyrey##$^&'
      expect(subject).to be_invalid
    end
  end

  describe 'associations' do
    it { should belong_to(:guest) }
  end
  
end
