class Apartment < ApplicationRecord
  belongs_to :landlord
  #belongs_to :house
  has_many :houses
  has_many :tenants through: :houses
end
