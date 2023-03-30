class Apartment < ApplicationRecord
  
  belongs_to :landlord
  has_many :houses
  has_many :tenants, through: :houses
end
