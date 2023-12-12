class ReflectionsController < ApplicationController
  def index
  end

  def new
    @date = params[:date]
    @reflection = Reflection.new
  end
  
  def create
    reflection = Reflection.new(reflection_params)
    reflection.save
    redirect_to calendars_path
  end

  def show
    @reflection = Reflection.find(params[:id])
  end

  def edit
    @reflection = reflection.find(params[:id])
  end
  
  def update
    reflection = Reflection.find(params[:id])
    reflection.update(reflection_params)
    redirect_to calendars_pat
  end
  
  private
  
  def reflections
    params.require(:reflection).permit(:schedule_id, :title, :content, :image)
  end
end
