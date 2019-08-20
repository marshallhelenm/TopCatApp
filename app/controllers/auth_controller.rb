class AuthController < ApplicationController

    def create #sesssion creator
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
        set_user
    end
    
    def login
    end

    def verify
        @user = User.find_by(username: params[:login][:username])
        if @user && @user.authenticate(params[:login][:password])
            session[:user_id] = @user.id
            redirect_to '/home'
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