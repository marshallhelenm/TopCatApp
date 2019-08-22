class Relationship < ApplicationRecord
    belongs_to :cat
    belongs_to :family

    def Relationship.best #finds the relationship with the highest affection score
        Relationship.all.max_by(|rel| rel.affection)
    end


end
