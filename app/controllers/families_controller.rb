class FamiliesController < ApplicationController
    before_action :grab_family, only: [:show, :edit, :update, :destroy]
    before_action :set_user, :set_cat


    def index
        @families = Family.all
    end
    
    def show
        @relationship = @cat.visit_family(@family)
        @interaction = @cat.interact_family(@family)
        @msg = @family.affection_msg(@cat)

    end
 
    def new
        @family = Family.new
    end

    def create
        @family = Family.new(family_params)
        @family.save
    end

    def edit
    end

    def update
        @family = Family.update(family_params)
        redirect_to family_path(@family)
    end

    def destroy
        @family.destroy
    end

    private

    def grab_family
        @family = Family.find(params[:id])
    end

    def family_params
        params.require(:family).permit(:name, :description, :poshness, :neighborhood_id)
    end
end
