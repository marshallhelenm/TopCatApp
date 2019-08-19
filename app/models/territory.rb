class Territory < ApplicationRecord
    belongs_to :cat
    belongs_to :neighborhood
end
