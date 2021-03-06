class NeighborhoodsController < ApplicationController
    before_action :grab_neighborhood, only: [:show, :edit, :update, :destroy]
    before_action :set_user, :redirect_user, :set_cat, :new_day?


    def index
        session[:neighborhood] = nil
        @neighborhoods = Neighborhood.all
    end
    
    def show
        session[:neighborhood] = @neighborhood
        if @neighborhood.event_cooldown == false
            if Neighborhood.random_event
                @neighborhood.event_cooldown = true
                @neighborhood.save
                redirect_to event_path(@neighborhood.other_events.sample)
            end

        else
            @neighborhood.event_cooldown = false
            @neighborhood.save
        end

        @territory = @cat.enter_neighborhood(@neighborhood) 
        #returns the relevant @territory
    end

    # def new
    #     @neighborhood = Neighborhood.new
    # end

    # def create
    #     @neighborhood = Neighborhood.new(neighborhood_params)
    #     @neighborhood.save
    # end

    # def edit
    # end

    # def update
    #     @neighborhood = Neighborhood.update(neighborhood_params)
    #     redirect_to neighborhood_path(@neighborhood)
    # end

    # def destroy
    #     @neighborhood.destroy
    # end

    private

    def grab_neighborhood
        @neighborhood = Neighborhood.find(params[:id])
    end

    def neighborhood_params
        params.require(:neighborhood).permit(:name, :description, :danger_rating)
    end

end
