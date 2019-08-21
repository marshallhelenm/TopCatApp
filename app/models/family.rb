class Family < ApplicationRecord
    has_many :relationships
    has_many :cats, through: :relationships
    belongs_to :neighborhood

    def self.random_event
        chance = rand(0..2)
        if chance == 0
            return true
        else
            return false
        end
    end

    def affection_msg(cat)
        case self.affection_level(cat)
        when "excellent"
            "The #{self.name} family friggin loves you!"
        when "high"
            "The #{self.name} family is very fond of you."
        when "medium"
            "The #{self.name} family likes you."
        when "low" 
            "The #{self.name} family doesn't know you very well yet."
        end
    end

    def find_relationship(cat)
        rel = self.relationships.find_by(cat_id: cat.id)
    end

    def give_affection(cat)
        rel = find_relationship(cat)
        rel.affection = rel.affection.to_i + 5
    end

    def affection_level(cat)
        rel = self.find_relationship(cat)
        if rel.affection >= 95
           level = "excellent"
        elsif rel.affection < 95 && rel.affection >= 80
            level = "high"
        elsif rel.affection < 80 && rel.affection >= 45
            level = "medium"
        else 
            level = "low"
        end
    end

    def posh_events
        self.neighborhood.posh_events
    end

    

end
