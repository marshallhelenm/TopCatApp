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
        self.save
    end

    def eat(food=0)
        if (self.hunger - food) > 9
            self.hunger = 9
        elsif (self.hunger - food) < 0
            self.hunger = 0
        else
            self.hunger -= food
        end
        self.save
    end

    def clean(wash=0)
        if (self.scraggliness - wash) > 6
            self.scraggliness = 6
        elsif (self.scraggliness - wash) < 0
            self.scraggliness = 0
        else
            self.scraggliness -= wash
        end
        self.save
        self.scraggliness += wash
    end


    def close_call(lives=0)
        self.lives += lives
        self.save
        if lives < 1
           "you died! game over! yikes!"
        end
    end

    def update_stats(food=0, wash=0, lives=0)
        self.eat(food)
        self.clean(wash)
        self.close_call(lives)
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
       if !self.families.include?(family)
        rel = Relationship.new(cat_id: self.id, family_id: family.id, affection: 1)
        rel.save
       else
        rel = family.find_relationship(self)
        rel
       end
    end

    def interact_family(family)
        if self.too_scraggly?(family)
            redirect_to event_path(family.posh_events.sample)
        elsif self.scraggliness > 4
            self.eat(family.poshness)
            family.give_affection(self, 1)

            return "You're pretty messy, so the family doesn't approach you. They do leave you some food, though."
        else
            self.eat(family.poshness)
            family.give_affection(self, 5)
            return "You eat up some food and then get in some good purrin and pettin time."
        end
    end

    def too_scraggly?(family)
        if family.poshness == 3 && self.scraggliness > 4
           true
        else
            false 
        end 
    end



end
