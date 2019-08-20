class ScreensController < ApplicationController
    before_action :set_user, :redirect_user

    def show 
        @user = User.find(params[:login][:username])
        @cat = @user.cats.first
    end
end