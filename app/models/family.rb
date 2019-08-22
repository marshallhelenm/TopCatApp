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

    def give_affection(cat, a_score)
        rel = self.find_relationship(cat)
        rel.affection = rel.affection.to_i + a_score
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

    ##analytics##

    def relationship_count
        self.relationships.count
    end

    
    
    def total_affection #totals up all the affection scores for one cat
        total = 0
        self.relationships.each do |rel|
            total += rel.affection
        end
        total
    end
    
    def Family.friendliest #returns top 5 families by how much affection they have with cats
        fam = Family.all.sort_by{ |fam| fam.total_affection }
        fam = fam.reverse
        fam = fam[0..4]
    end

    def favorite_cat
        rel = self.relationships.max_by{ |rel| rel.affection }
        if rel == nil
            return "This family doesn't know any cats yet!"
        else
            rel.cat.name
        end
    end

end
