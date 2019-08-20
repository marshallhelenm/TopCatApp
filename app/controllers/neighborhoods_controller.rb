class NeighborhoodsController < ApplicationController
    before_action :grab_neighborhood, only: [:show, :edit, :update, :destroy]
    before_action :set_user, :redirect_user


    def index
        session[:playing] = true
        @neighborhoods = Neighborhood.all
    end
    
    def show
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
