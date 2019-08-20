class NeighborhoodsController < ApplicationController
    before_action :grab_neighborhood, only: [:show, :edit, :update, :destroy]
    before_action :set_user, :redirect_user, :set_cat


    def index
        session[:playing] = true
        session[:cat_id] = set_cat.id
        @neighborhoods = Neighborhood.all
    end
    
    def show
        @territory = @cat.enter_neighborhood(@neighborhood) 
        #returns the relevant @territor
    end

    def new
        @neighborhood = Neighborhood.new
    end

    def create
        @neighborhood = Neighborhood.new(neighborhood_params)
        @neighborhood.save
    end

    def edit
    end

    def update
        @neighborhood = Neighborhood.update(neighborhood_params)
        redirect_to neighborhood_path(@neighborhood)
    end

    def destroy
        @neighborhood.destroy
    end

    private

    def grab_neighborhood
        @neighborhood = Neighborhood.find(params[:id])
    end

    def neighborhood_params
        params.require(:neighborhood).permit(:name, :description, :danger_rating)
    end
end
