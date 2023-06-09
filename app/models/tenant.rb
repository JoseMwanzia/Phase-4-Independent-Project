class Tenant < ApplicationRecord
    has_secure_password

    has_many :reviews
    has_many :houses, through: :reviews

end
