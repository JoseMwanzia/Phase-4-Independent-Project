class HouseSerializer < ActiveModel::Serializer
  attributes :id, :house_number, :description, :rent, :tenant_id, :apartment_id


end
