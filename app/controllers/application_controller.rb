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

    PETPICS = ["https://images2.minutemediacdn.com/image/upload/c_crop,h_359,w_640,x_0,y_61/f_auto,q_auto,w_1100/v1555432243/shape/mentalfloss/catscratch.jpg", "https://kittentoob.com/wp-content/uploads/2017/09/Pet-a-Cat.jpg", "http://cravingcatnip.com/wp-content/uploads/2016/10/happy-cat-getting-petted4.jpg", "https://img.webmd.com/dtmcms/live/webmd/consumer_assets/site_images/articles/health_tools/things_you_learn_from_your_pet_slideshow/photolibrary_rm_photo_of_petting_cat.jpg"]

    def random_pet_pics
        PETPICS.sample
    end

    GROOMPICS = ["https://media.istockphoto.com/videos/cat-grooming-video-id845399712?s=640x640", "https://thumbs.dreamstime.com/b/grey-cat-grooming-its-tail-grey-cat-grooming-its-tail-tounge-123991026.jpg", "https://media.istockphoto.com/videos/cat-clean-body-and-paw-by-itself-while-before-sleep-look-so-relax-and-video-id880901836?s=640x640", "https://previews.123rf.com/images/nungning20/nungning201805/nungning20180500076/102004488-tricolor-cat-stick-tongue-out-and-licking-itself-cat-grooming.jpg", "https://media.istockphoto.com/videos/tabby-cat-selfgrooming-video-id996272110?s=640x640"]


    def random_groom_pics
        GROOMPICS.sample
    end
end
