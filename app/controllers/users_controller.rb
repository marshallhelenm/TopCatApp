class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]


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
            redirect_to '/cats/new'
        else
            render :new
        end
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

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
