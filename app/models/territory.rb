class Territory < ApplicationRecord
    belongs_to :cat
    belongs_to :neighborhood

    def cat_name
        self.cat.name
    end

    def neighborhood_name
        self.neighborhood.name
    end

end
