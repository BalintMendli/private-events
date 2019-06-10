class AttendancesController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:attendances][:name])
    event_id=params[:attendances][:event_id]
    @attendance=Attendance.new(attendee_id: user.id, attended_event_id: event_id)
    if @attendance.save
      flash[:success] = 'User successfully invited!'
      redirect_to event_path(id: event_id)
    else
      render :new
    end
  end
end
