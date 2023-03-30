class HouseApartmentSerializer < ActiveModel::Serializer
  attributes :id, :house_number, :description


  belongs_to :apartment
end
