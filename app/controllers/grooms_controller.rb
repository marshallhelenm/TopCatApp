class GroomsController < ApplicationController
    before_action :set_user, :redirect_user, :set_cat

    def show
        new_day?
        @cat.clean(-2)
        take_action
        @gpic = random_groom_pics
    end
end