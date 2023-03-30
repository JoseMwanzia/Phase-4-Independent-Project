class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :rating, :description

  belongs_to :tenant
end
