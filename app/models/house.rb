class House < ApplicationRecord
  belongs_to :tenant
  belongs_to :apartment
  has_many :reviews, depedant: :delete


  validates :description, {
    presence: true
  }


end
