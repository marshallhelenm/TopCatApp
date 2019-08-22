class ForagesController < ApplicationController
    before_action :set_user, :redirect_user, :set_cat

    def show
        new_day?
        @food = rand(0..1)
        @cat.eat(@food)
        take_action
    end
end