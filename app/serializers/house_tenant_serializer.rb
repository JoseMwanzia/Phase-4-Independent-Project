class HouseTenantSerializer < ActiveModel::Serializer
  attributes :house_number, :description

  belongs_to :tenant
end
