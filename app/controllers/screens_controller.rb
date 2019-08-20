class ScreensController < ApplicationController
    def show 
        @user = User.find(params[:login][:username])
        @cat = @user.cats.first
    end
end