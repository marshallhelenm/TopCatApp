class Family < ApplicationRecord
    has_many :relationships
    has_many :cats, through: :relationships
    belongs_to :neighborhood
end
