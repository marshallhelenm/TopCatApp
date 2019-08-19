class CatsController < ApplicationController
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
        byebug
        @cat = Cat.new(name: params[:cat][:name], breed: params[:cat][:breed], description: params[:cat][:description], user_id: params[:cat][:user_id], img_url: params[:cat][:img_url])
        @cat.set_stats
        @cat.save
    end

    def edit
    end

    def update
        @cat = Cat.update(cat_params)
        redirect_to cat_path(@cat)
    end

    def destroy
        @cat.destroy
    end

    private

    def grab_cat
        Cat.find(params[:id])
    end

    def cat_params
        params.require(:cat).permit(:name, :breed, :description)
    end
end
