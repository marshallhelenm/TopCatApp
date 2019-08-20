class ScreensController < ApplicationController
    before_action :set_user, :redirect_user, :set_cat

    def show
        session[:playing] = false
        session[:cat_id] = set_cat.id
    end


end