class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :redirect_user, except: [:new, :create]

    def index #game rules
    end
    
    def show #account page
        #a page for my account info, which includes an option to edit your account
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            session[:user] = @user
            session[:cat] = Cat.new
            redirect_to '/cats/new'
        else
            render :new
        end

    end

    def edit
        set_cat
    end

    def update
        if @user.update(user_params)
            session[:user_id] = @user.id
            redirect_to '/home'
        else
            render :edit
        end
    end

    def destroy
        @user.destroy
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
