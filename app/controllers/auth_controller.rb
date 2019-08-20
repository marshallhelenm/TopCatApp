class AuthController < ApplicationController

    def create
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
    end
    
    def login
    end

    def verify
        # byebug
        @user = User.find_by(username: params[:login][:username])
        if @user && @user.authenticate(password: params[:login][:password])
            redirect_to 'screens/home'
        else 
            flash[:error_message] = "Please try again!"
            render :login
        end
    end 


    def logout
        session.clear
        redirect_to login_path
    end
    
end