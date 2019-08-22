class AuthController < ApplicationController


 
    

    def create #sesssion creator
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
        set_user
    end
    
    def login
        session[:catpics] = catpics
        @pic = session[:catpics].sample
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

    def catpics
        @catpics = [
            "https://cdn.pixabay.com/photo/2016/10/11/18/18/white-cat-1732388__480.png",
            "https://cdn.pixabay.com/photo/2016/10/11/18/18/white-cat-1732386__480.png",
            "https://cdn.pixabay.com/photo/2016/10/11/18/18/tortie-cat-1732385__480.png",
            "https://cdn.pixabay.com/photo/2016/10/11/18/18/tortie-cat-1732384__480.png",
            "https://cdn.pixabay.com/photo/2016/10/11/18/17/orange-tabby-cat-1732377__480.png",
            "https://cdn.pixabay.com/photo/2016/10/11/18/17/orange-tabby-cat-1732376__480.png",
            "https://cdn.pixabay.com/photo/2016/10/11/18/17/gray-tabby-cat-1732374__480.png",
            "https://cdn.pixabay.com/photo/2016/10/11/18/17/gray-tabby-cat-1732372__480.png",
            "https://cdn.pixabay.com/photo/2016/10/11/18/17/calico-cat-1732371__480.png",
            "https://cdn.pixabay.com/photo/2016/10/11/18/17/calico-cat-1732370__480.png",
            "https://cdn.pixabay.com/photo/2016/10/11/18/17/black-cat-1732366__480.png",
            "https://cdn.pixabay.com/photo/2016/10/11/18/17/black-cat-1732367__480.png"
        ]
    end

end