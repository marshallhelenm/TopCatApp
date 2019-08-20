class ScreensController < ApplicationController
    before_action :set_user, :redirect_user

    def show
        set_user
        @cat = @user.cats.first
    end
end