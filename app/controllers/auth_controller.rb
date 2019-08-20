class AuthController < ApplicationController
    
    def login
    end

    def verify
        # byebug
        @user = User.find_by(username: params[:login][:username])
        if @user && @user.authenticate(password: params[:login][:password])
            redirect_to 'screens/show'
        else 
            flash[:error_message] = "Please try again!"
            render :login
        end
    end 

end