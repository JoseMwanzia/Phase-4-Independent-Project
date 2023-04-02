class TenantSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :identification


  has_many :houses
  
end
