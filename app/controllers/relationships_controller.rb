class RelationshipsController < ApplicationController
    before_action :grab_relationship, only: [:show, :edit, :update, :destroy]
    before_action :set_user, :redirect_user, :set_cat


    # def index
    #     @relationships = Relationship.all
    # end
    
    # def show
    # end

    # def new
    #     @relationship = Relationship.new
    # end

    # def create
    #     @relationship = Relationship.new(relationship_params)
    #     @relationship.save
    # end

    # def edit
    # end

    # def update
    #     @relationship = Relationship.update(relationship_params)
    #     redirect_to relationship_path(@relationship)
    # end

    # def destroy
    #     @relationship.destroy
    # end

    private

    def grab_relationship
        Relationship.find(params[:id])
    end

    def relationship_params
        params.require(:relationship).permit(:cat_id, :family_id, :affection)
    end
end
