class GroomsController < ApplicationController
    before_action :set_user, :redirect_user, :set_cat

    def index
    end

    def show
        @cat.clean(-2)
    end
end