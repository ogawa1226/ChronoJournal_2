class SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    @word = params[:word]
    
    if @range == "Schedule"
      @schedules = Schedule.looks(params[:search], params[:word])
    else
      @reflections = Reflection.looks(params[:search], params[:word])
    end
  end
end