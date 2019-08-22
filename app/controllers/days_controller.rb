class DaysController < ApplicationController
    before_action :set_user, :redirect_user, :set_cat

    def index #displayed when you finish a day '/end_day'
    end 

    def show #displayed when you start a new day '/new_day'
        start_day
        session[:playing] = true
        session[:cat_id] = set_cat.id
        @starving = night_hunger
        @cat.close_call(-1) if @starving
    end

    private

    def night_hunger
        if @cat.hunger > 4
            @cat.hunger = 6
            @cat.save
            true
        else
            @cat.eat(-4)
            false
        end
    end

end