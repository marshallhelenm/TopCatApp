class ScreensController < ApplicationController
    before_action :set_user, :redirect_user

    def show
        session[:playing] = false
        session[:cat_id] = set_cat.id
        set_user
        set_cat
    end


end