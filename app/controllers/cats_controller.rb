class CatsController < ApplicationController
    before_action :set_user, :redirect_user
    before_action :grab_cat, only: [:show, :edit, :update, :destroy]

    def index
        @cats = Cat.all
    end
    
    def show
    end

    def new
        @cat = Cat.new
    end

    def create
        @cat = Cat.new(cat_params)
        @cat.set_stats
        @cat.save
        @user.cats << @cat
        redirect_to '/home'
    end

    def edit
    end

    def update
        @cat = Cat.update(cat_params)
        redirect_to '/home'
    end

    def destroy
        @cat.destroy
        redirect_to new_cat_path
    end

    private

    def grab_cat
        # byebug
        @cat = set_user.cats.first
        # Cat.find(params[:cat][:id])
    end

    def cat_params
        params.require(:cat).permit(:name, :breed, :description)
    end

end
