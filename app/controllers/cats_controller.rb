class CatsController < ApplicationController
    before_action :set_user, :redirect_user
    before_action :grab_cat, only: [:show, :edit, :update, :destroy]
    before_action :set_cat, only: [:index, :show]

    def index
        @cats = Cat.all
        @high = Cat.most_affection
        @best = Relationship.best
        @friendliest = Family.friendliest
        @avg_affection = Cat.avg_affection
        @top = @high.first
    end
    
    def show #your cat's stats
        
    end

    def new
        @cat = Cat.new
        @pic = session[:catpics].values.sample
        menupics
    end

    def create
        @cat = Cat.new(cat_params)
        @cat.set_stats
        @cat.img_url = cat_pic
        @cat.save
        @user.cats << @cat
        redirect_to '/home'
    end

    def edit
        menupics
    end

    def update
        @cat.update(cat_params)
        @cat.img_url = cat_pic
        @cat.save
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

    def cat_pic
        pic_string = session[:catpics][params[:cat][:"img_url"]]
    end

end
