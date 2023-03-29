class Review < ApplicationRecord
  belongs_to :tenant
  belongs_to :house
end
