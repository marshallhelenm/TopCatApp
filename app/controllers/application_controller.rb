class ApplicationController < ActionController::Base
    helper_method :logged_in?, :redirect_user, :set_user, :playing?, :set_cat, :day, :menupics, :random_cat_pic

    def logged_in?
        !!session[:user_id]
    end

    def redirect_user
        if !logged_in?
            redirect_to login_path
        end
    end
    
    def set_user
        if logged_in?
            @user = User.find_by(id: session[:user_id])
        end
    end

    def set_cat
        @cat = @user.cats.first
    end

    def playing?
        !!session[:playing]
    end

    def start_day
        session[:actions] = 0
    end

    def take_action
        session[:actions] += 1
    end

    def new_day?
        if session[:actions] == 5
            session[:actions] = 0
            redirect_to '/end_day'
        end
    end

    def menupics
        # byebug
        @menupics = CATPICS.keys
    end

    CATPICS = {
        "White Cat 1" => "https://cdn.pixabay.com/photo/2016/10/11/18/18/white-cat-1732388__480.png",
        "White Cat 2" => "https://cdn.pixabay.com/photo/2016/10/11/18/18/white-cat-1732386__480.png",
        "Tortie Cat 1" => "https://cdn.pixabay.com/photo/2016/10/11/18/18/tortie-cat-1732385__480.png",
        "Tortie Cat 2" => "https://cdn.pixabay.com/photo/2016/10/11/18/18/tortie-cat-1732384__480.png",
        "Orange Tabby 1" => "https://cdn.pixabay.com/photo/2016/10/11/18/17/orange-tabby-cat-1732377__480.png",
        "Orange Tabby 2" => "https://cdn.pixabay.com/photo/2016/10/11/18/17/orange-tabby-cat-1732376__480.png",
        "Gray Tabby 1" => "https://cdn.pixabay.com/photo/2016/10/11/18/17/gray-tabby-cat-1732374__480.png",
        "Gray Tabby 2" => "https://cdn.pixabay.com/photo/2016/10/11/18/17/gray-tabby-cat-1732372__480.png",
        "Calico Cat 1" => "https://cdn.pixabay.com/photo/2016/10/11/18/17/calico-cat-1732371__480.png",
        "Calico Cat 2" => "https://cdn.pixabay.com/photo/2016/10/11/18/17/calico-cat-1732370__480.png",
        "Black Cat 1" => "https://cdn.pixabay.com/photo/2016/10/11/18/17/black-cat-1732366__480.png",
        "Black Cat 2" => "https://cdn.pixabay.com/photo/2016/10/11/18/17/black-cat-1732367__480.png"
    }

    def random_cat_pic
        CATPICS.values.sample
    end

end
