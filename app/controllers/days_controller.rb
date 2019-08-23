class DaysController < ApplicationController
    before_action :set_user, :redirect_user, :set_cat

    def index #displayed when you finish a day '/end_day'
        @cat.days += 1
        @cat.save 
    end 

    def show #displayed when you start a new day '/new_day'
        start_day
        session[:playing] = true
        session[:cat_id] = set_cat.id
        if @cat.days > 0
            @cat.close_call(-1) if @starving
            @starving = night_hunger
        end
    end
 
    private

    def night_hunger
        @cat.clean(2)
        if @cat.hunger > 4
            @cat.hunger = 6
            @cat.save
            return true
        else
            @cat.eat(-4)
            return false
        end
    end

end