class Territory < ApplicationRecord
    belongs_to :cat
    belongs_to :neighborhood

    def cat_name
        self.cat.name
    end

    def neighborhood_name
        self.neighborhood.name
    end

    def cred
        if self.cat_status
            cred = self.cat_status
        else 
            cred = 0
        end


        if self.cat.avg_affection >= 95
            cred += 2
        elsif self.cat.avg_affection >= 80 
            cred += 1
        end
        
        if cred >= 8
            return "high"
        elsif cred >= 4
            return "medium"
        else 
            return "low"
        end
            
    end

    def neighborhood_name
        self.neighborhood.name
    end

end
