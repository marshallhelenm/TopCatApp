class EventsController < ApplicationController
    before_action :grab_event, only: [:show, :edit, :update, :destroy]
    before_action :set_user, :redirect_user, :set_cat


    def index
        @events = Event.all
    end
    
    def show
        @cat.update_stats(@event.hunger_score, @event.scraggliness_score, @event.lives_score)
        set_territory
        @territory.change_cred(@event.cred_score)
    end

    # def new
    #     @event = Event.new
    # end

    # def create
    #     @event = Event.new(event_params)
    #     @event.save
    # end

    # def edit
    # end

    # def update
    #     @event = Event.update(event_params)
    #     redirect_to neighborhood_path(@event)
    # end

    # def destroy
    #     @event.destroy
    # end

    private

    def grab_event
        @event = Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:title, :description, :hazard_rating, :neighborhood_id, :scraggliness_score, :hunger_score, :lives_score)
    end

    def set_territory
        @territory = @cat.territories.find_by(neighborhood_id: session[:neighborhood]["id"])
    end
end
