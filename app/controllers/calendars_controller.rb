class CalendarsController < ApplicationController
  before_action :set_beginning_of_week

  def index
    @date = params[:date]
    @schedules = current_user.schedules
  end

  private

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end

end
