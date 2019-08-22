class ScreensController < ApplicationController
    before_action :set_user, :redirect_user, :set_cat

    def index #detour for exiting neighborhood
        session[:neighborhood] = nil
        new_day?
        take_action
        redirect_to '/neighborhoods'
    end


    def show 
        session[:playing] = false
        session[:cat_id] = set_cat.id
        @mypic = @cat.img_url
    end


end