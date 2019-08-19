class ApplicationController < ActionController::Base

    def show 
        @user = User.first #obviously TODO: fix this
        @cat = @user.cats.first
    end
    
    def log_in_page
        render :log_in_page
    end

    def log_in
        if #new user
            redirect_to #new user path
        else 
            #log them in somehow
        end
        redirect_to #homescreen
    end 


end
