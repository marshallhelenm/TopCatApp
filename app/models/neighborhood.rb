class Neighborhood < ApplicationRecord
    has_many :territories
    has_many :cats, through: :territories
    has_many :families
    has_many :events

    def self.random_event
        chance = rand(0..1)
        if chance == 0
            return true
        else
            return false
        end
    end
    
    def cred(territory)
        # byebug
        if territory.cat_status == 1
            "#{territory.cat_name} is a non-entity in #{territory.neighborhood_name}. They'll need to up their game to gain respect with the other cats."
        elsif territory.cat_status == 2
            "#{territory.cat_name} is liked well enough around #{territory.neighborhood_name}. They're far from Top Cat, but they're not doing too badly."
        else territory.cat_status == 3
            "#{territory.cat_name} is Top Cat in #{territory.neighborhood_name}. All the cats wish they had what #{territory.cat_name} has."
        end
    end
    
end
