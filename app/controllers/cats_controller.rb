class CatsController < ApplicationController
    before_action :grab_cat, only: [:show, :edit, :update, :destroy]
    before_action :set_user

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
        redirect_to '/home'
    end

    def edit
    end

    def update
        @cat = Cat.update(cat_params)
        redirect_to cat_path(@cat)
    end

    def destroy
        @cat.destroy
        redirect_to :new
    end

    private

    def grab_cat
        Cat.find(params[:cat][:id])
    end

    def cat_params
        params.require(:cat).permit(:name, :breed, :description)
    end
end
