class CalendarsController < ApplicationController
  def index
    @date = params[:date]
    @schedules = Schedule.all
  end

  before_action :set_beginning_of_week

  private

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end

end
