class EventsController < ApplicationController
  def new
    @event = current_user.events.build
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @past = Event.past
    @upcoming = Event.upcoming
  end

  private

    def event_params
      params.require(:event).permit(:name, :description, :date)
    end
end
