class Relationship < ApplicationRecord
    belongs_to :cat
    belongs_to :family

    def Relationship.best #returns top 5 relationships
        best = Relationship.all.sort_by{ |rel| rel.affection }
        best = best.reverse
        best = best[0..4]
    end

    def cat_name
        self.cat.name 
    end

    def family_name
        self.family.name 
    end

    def username
        self.cat.user.username
    end
end
