class AttendancesController < ApplicationController
  def new
    @event_id = @event_id || params[:event_id]
    redirect_to events_path if !@event_id
  end

  def create
    user = User.find_by(name: params[:attendances][:name])
    @event_id = params[:attendances][:event_id]
    if !current_user.own_event?(@event_id)
      redirect_to events_path
      return
    end
    @attendance = Attendance.new(attendee_id: user&.id, attended_event_id: @event_id)
    if @attendance.save
      flash[:success] = 'User successfully invited!'
      redirect_to event_path(id: @event_id)
    else
      flash.now[:danger] = 'Invalid user!'
      render :new
    end
  end

  def invitations
    @unconfirmed_events = current_user.unconfirmed_events
    @confirmed_events = current_user.confirmed_events
  end

  def update
    attendance = Attendance.find_by(attendee_id: current_user.id, attended_event_id: params[:event_id])
    attendance.update_attributes(confirmation: true)
    flash[:success] = 'Invitation confirmed!'
    redirect_to invitations_path
  end
end
