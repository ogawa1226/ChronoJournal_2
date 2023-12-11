class SchedulesController < ApplicationController

  def index
    @date = params[:date]
    @schedules = Schedule.where(@date)
    # @schedules = Schedule.where(day: @date)
  end

  def new
    @date = params[:date]
    @schedule = Schedule.new
  end

  def create
    schedule = Schedule.new(schedule_params)
    schedule.user_id = current_user.id
    schedule.save
    redirect_to calendars_path
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    schedule = Schedule.find(params[:id])
    schedule.update(schedule_params)
    redirect_to calendars_path
  end
  
  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to calendars_path
  end
  
  private

  def schedule_params
    params.require(:schedule).permit(:user_id, :category_id, :day, :title, :start_time, :end_time, :all_day, :memo)
  end
end
