class ForagesController < ApplicationController
    before_action :set_user, :redirect_user, :set_cat

    def index
    end

    def show
        @food = rand(0..1)
        @cat.eat(@food)
    end
end