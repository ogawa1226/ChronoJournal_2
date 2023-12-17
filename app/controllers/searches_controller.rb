class SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    @word = params[:word]
    
    if @range == "Schedule"
      @schedules = Schedule.looks(params[:word])
    else
      @reflections = Reflection.looks(params[:word])
    end
  end
  
  def search_tag
    @reflections = Reflection.where(tag_id: params[:id])
    @tag = Tag.find(params[:id])
  end
end