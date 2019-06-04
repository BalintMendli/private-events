class EventsController < ApplicationController
  def new
    @event = Event.new
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
  end

  def index
  end

  private

    def event_params
      params.require(:event).permit(:name, :description, :date)
    end
end
