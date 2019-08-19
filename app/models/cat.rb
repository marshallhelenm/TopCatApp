class Cat < ApplicationRecord
    has_many :relationships
    has_many :families, through: :relationships
    has_many :territories
    has_many :neighborhoods, through: :territories
    belongs_to :user


    def set_stats
        self.hunger = 2
        self.lives = 9
        self.scraggliness = 2
    end
end
