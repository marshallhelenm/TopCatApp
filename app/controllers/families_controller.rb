class FamiliesController < ApplicationController
    before_action :grab_family, only: [:show, :edit, :update, :destroy]
    before_action :set_user, :set_cat


    def index
        @families = Family.all
    end
    
    def show
        new_day?
        @relationship = @cat.visit_family(@family)
        @interaction = interact_family
        @msg = @family.affection_msg(@cat)
        take_action
    end
 
    # def new
    #     @family = Family.new
    # end

    # def create
    #     @family = Family.new(family_params)
    #     @family.save
    # end

    # def edit
    # end

    # def update
    #     @family = Family.update(family_params)
    #     redirect_to family_path(@family)
    # end

    # def destroy
    #     @family.destroy
    # end

    private

    def grab_family
        @family = Family.find(params[:id])
    end

    def family_params
        params.require(:family).permit(:name, :description, :poshness, :neighborhood_id)
    end


    def interact_family
        if @cat.too_scraggly?(@family)
            redirect_to event_path(@family.posh_events.sample)
        elsif @cat.scraggliness > 4
            @cat.eat(@family.poshness)
            @family.give_affection(@cat, 1)

            return "You're pretty messy, so the family doesn't approach you. They do leave you some food, though. Hunger - #{@family.poshness} Affection + 1"
        else
            @cat.eat(@family.poshness)
            @family.give_affection(@cat, 5)
            return "You eat up some food and then get in some good purrin and pettin time. Hunger - #{@family.poshness} Affection + 5"
        end
    end

end
