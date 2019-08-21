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
        session[:action] = 0
    end

    def take_action
        session[:action] += 1
    end

    def day
        if session[:action] = 5
            session[:action] = 0
            redirect_to '/day'
        else
            take_action
        end
    end


end
