class Guest < ApplicationRecord
  has_many :reservations

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  
  
end
