class MarksController < ApplicationController

  def create
    @schedule = Schedule.find(params[:schedule_id])
    mark = @schedule.marks.new(user_id: current_user.id)
    mark.save
  end

  def destroy
    @schedule = Schedule.find(params[:schedule_id])
    mark = current_user.marks.find_by(schedule_id: @schedule.id)
    mark.destroy
  end

  def index
    marks = current_user.marks.pluck("schedule_id")
    @schedules = Schedule.where(id: marks)
  end

end
