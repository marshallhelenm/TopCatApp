class EventsController < ApplicationController
    before_action :grab_event, only: [:show, :edit, :update, :destroy]
    before_action :set_user, :redirect_user


    def index
        @events = Event.all
    end
    
    def show
    end

    def new
        @event = Event.new
    end

    def create
        @event = Event.new(event_params)
        @event.save
    end

    def edit
    end

    def update
        @event = Event.update(event_params)
        redirect_to neighborhood_path(@event)
    end

    def destroy
        @event.destroy
    end

    private

    def grab_event
        Event.find(params[:id])
    end

    def event_params
        params.require(:event).permit(:title, :description, :hazard_rating, :neighborhood_id, :scraggliness_score, :hunger_score, :lives_score)
    end
end
