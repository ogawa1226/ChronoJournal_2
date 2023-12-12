class CalendarsController < ApplicationController
  def index
    @date = params[:date]
    @schedules = Schedule.all
  end
end
