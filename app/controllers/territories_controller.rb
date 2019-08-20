class TerritoriesController < ApplicationController
    before_action :grab_territory, only: [:show, :edit, :update, :destroy]
    before_action :set_user, :redirect_user


    def index
        @territories = Territory.all
    end
    
    def show
    end

    def new
        @territory = Territory.new
    end

    def create
        @territory = Territory.new(territory_params)
        @territory.save
    end

    def edit
    end

    def update
        @territory = Territory.update(territory_params)
        redirect_to territory_path(@territory)
    end

    def destroy
        @territory.destroy
    end

    private

    def grab_territory
        Territory.find(params[:id])
    end

    def territory_params
        params.require(:territory).permit(:cat_id, :neighborhood_id, :cat_status)
    end
end
