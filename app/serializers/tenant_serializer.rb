class TenantSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :identification
  
end
