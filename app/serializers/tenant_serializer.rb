class TenantSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :identification, :password_digest
end
