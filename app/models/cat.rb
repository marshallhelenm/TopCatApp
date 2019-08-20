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


    def enter_neighborhood(neighborhood)
       if !neighborhood.cats.include?(self)
        neighborhood.cats << self
       end
        territory = self.territories.find_by(neighborhood_id: neighborhood.id)
        territory.cat_status = 1
        territory
    end



end
