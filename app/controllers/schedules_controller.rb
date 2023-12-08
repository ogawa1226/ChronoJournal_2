class SchedulesController < ApplicationController
  def index
  #   @date = params[:date] ? Date.parse(params[:date]) : Date.today
  #   @schedules = Schedule.where(date: @date.beginning_of_month..@date.end_of_month)
  end

  def show
    @schedule = Schedule.find_by(day: params[:id])
  end

  def new
    @schedule = Schedule.new
  end
  
  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    @schedule.save
    redirect_to schedule_path(schedule.id)
  end

  def edit
    @schedule = Schedule.find_by(day: params[:id])
  end
  
  private
  
  def schedule_params
    params.require(:schedule).permit(:day, :title, :start_time, :end_time, :all_day, :memo).merge(user_id: current_user.id)
  end
end
