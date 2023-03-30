class House < ApplicationRecord
  
  belongs_to :apartment
  has_many :reviews, dependent: :destroy
  has_many :tenants, through: :reviews
end
