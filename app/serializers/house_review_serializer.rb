class HouseReviewSerializer < ActiveModel::Serializer
  attributes :house_number, :description

  belongs_to :apartment
end
