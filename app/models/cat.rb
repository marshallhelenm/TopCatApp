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

    def eat(food)
        self.hunger += food
        self.save
    end

    def clean(wash)
        self.scraggliness += wash
        self.save
    end

    def close_call
        self.lives -= 1
        self.save
    end


    def enter_neighborhood(neighborhood)
       if !neighborhood.cats.include?(self)
        neighborhood.cats << self
       end
        territory = self.territories.find_by(neighborhood_id: neighborhood.id)
        territory.cat_status = 1
        territory
    end

    

    def visit_family(family)
       if !family.cats.include?(self)
        family.cats << self
       end
        relationship = self.relationships.find_by(family_id: family.id)
        relationship.affection = 1
        relationship
    end

    def interact_family(family)
        if self.scraggliness > 4 && family.poshness == 3
            #trigger a negative family related event
        else
            self.feed(family.poshness)
        end
    end


end
