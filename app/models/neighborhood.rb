class Neighborhood < ApplicationRecord
    has_many :territories
    has_many :cats, through: :territories
    has_many :families
    has_many :events

    def self.random_event
        chance = rand(0..2)
        if chance == 0
            return true
        else
            return false
        end
    end
end
