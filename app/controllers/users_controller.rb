class UsersController < ApplicationController
    before_action :grab_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end
    
    def show
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        @user.save
    end

    def edit
    end

    def update
        @user = User.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        @user.destroy
    end

    private

    def grab_user
        User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
