class Neighborhood < ApplicationRecord
    has_many :territories
    has_many :cats, through: :territories
    has_many :families
    has_many :events
end
