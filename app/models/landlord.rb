class Landlord < ApplicationRecord
    has_secure_password


    has_many :apartments, dependent: :destroy

end
