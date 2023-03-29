class ApartmentHousesSerializer < ActiveModel::Serializer
  attributes :id, :name, :location, :type

  has_many :houses
end
