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

    def affection(relationship)
        byebug
        if #relationship is low
            #low relationship message
        elsif #relationship is medium
            #med msg
        elsif #relationship is high
            #high msg
        else # relationship is extra high
            #This family friggin loves you!
        end

    end
end
