class HouseReviewsSerializer < ActiveModel::Serializer
  attributes :id, :house_number, :description

  has_many :reviews

end
