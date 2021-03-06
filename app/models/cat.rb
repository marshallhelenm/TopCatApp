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
        self.days = 0
        self.save
    end

    def eat(food=0)
        if (self.hunger - food) > 6
            self.hunger = 6
        elsif (self.hunger - food) < 0
            self.hunger = 0
        else
            self.hunger -= food
        end
        self.save
    end

    def clean(filth=0)
        if (self.scraggliness + filth) > 6
            self.scraggliness = 6
        elsif (self.scraggliness + filth) < 0
            self.scraggliness = 0
        else
            self.scraggliness += filth
        end
        self.save
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

    def too_scraggly?(family)
        if family.poshness == 3 && self.scraggliness > 4
           true
        else
            false 
        end 
    end

 

    ####analytics####

    def total_affection #totals up all the affection scores for one cat
        total = 0
        self.relationships.each do |rel|
            total += rel.affection
        end
        total
    end

    def Cat.most_affection #returns top 5 cats by their total affection scores
        cats = Cat.all.sort_by{ |cat| cat.total_affection }
        cats = cats.reverse
        cats = cats[0..4]
    end

    def username
        self.user.username
    end

    def Cat.avg_affection
        total = 0
        Cat.all.each do |cat|
            total += cat.total_affection
        end
        avg = total / Cat.all.count
        avg
    end

    def avg_affection
        total = 0
        self.relationships.each do |rel|
            total += rel.affection
        end
        if self.relationships.count != 0
            avg = total / self.relationships.count
        else
            avg = 0
        end
        avg
    end

    def favorite_family
        rel = self.relationships.max_by{ |rel| rel.affection }
        if rel == nil
            return "No One! This cat doesn't know any families yet"
        else
            rel.family.name
        end
    end




end
