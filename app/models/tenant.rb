class Tenant < ApplicationRecord

    has_secure_password

    belongs_to :house
    has_many :reviews

end
