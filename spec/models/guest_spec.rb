require 'rails_helper'

RSpec.describe Guest, type: :model do
  subject { 
    described_class.new(
      first_name: 'John',
      last_name: 'Cena'
    )
  }
  
  describe 'validations' do
    it 'is valid with valid attributes' do
      subject.email = 'johncena@testemail.com'
      expect(subject).to be_valid
    end
  
    it 'is not valid without an email' do
      subject.email = ''
      expect(subject).to be_invalid
    end
  
    it 'is not valid with an invalid email format' do
      subject.email = '@@.com'
      expect(subject).to be_invalid
    end
  end

  describe 'associations' do
    it { should have_many(:reservations) }
  end
end
