class ApplicationController < ActionController::Base
    helper_method :logged_in?, :redirect_user, :set_user, :playing?, :set_cat, :day, :menupics, :random_cat_pic, :random_pet_pics, :random_groom_pics

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

    PETPICS = ["https://media1.tenor.com/images/76f8e2f9b8af6d26b6754ca7cba6cc98/tenor.gif?itemid=5828064", "https://78.media.tumblr.com/b1af988bed594114b844e8b542af802c/tumblr_peuxv0Cdh01xo6wolo1_1280.gif","https://i.imgur.com/9AezDBg.gif"]

    def random_pet_pics
        PETPICS.sample
    end

    GROOMPICS = ["https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a1ca53e7-c323-4cb1-905b-2c82bd08bd87/dj7o8b-4eae16c8-71bd-4677-b087-8dad08f6c723.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2ExY2E1M2U3LWMzMjMtNGNiMS05MDViLTJjODJiZDA4YmQ4N1wvZGo3bzhiLTRlYWUxNmM4LTcxYmQtNDY3Ny1iMDg3LThkYWQwOGY2YzcyMy5qcGcifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6ZmlsZS5kb3dubG9hZCJdfQ.PnGQ7t4tDYmuzG8EPUtEuwMzCpLD29Yyq4bTGCohOVw", "https://www.hacksforcats.com/wp-content/uploads/2017/11/cat-bath.jpg"]


    def random_groom_pics
        GROOMPICS.sample
    end
end
