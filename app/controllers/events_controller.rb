class EventsController < ApplicationController
  def new
    if current_user
      @event = current_user.events.build
    else
      redirect_to events_path
    end
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id
    if @event.save
      flash[:success] = 'Event saved!'
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
