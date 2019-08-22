class ApplicationController < ActionController::Base
    helper_method :logged_in?, :redirect_user, :set_user, :playing?, :set_cat, :day

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


end
