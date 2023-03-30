class Landlord < ApplicationRecord
    has_many :apartments, dependent: :destroy

end
