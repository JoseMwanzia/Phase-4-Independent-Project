class HouseTenantSerializer < ActiveModel::Serializer
  attributes :id, :house_number, :description

  belongs_to :tenant
end
