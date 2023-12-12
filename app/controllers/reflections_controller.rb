class ReflectionsController < ApplicationController
  def index
  end

  def new
    @date = params[:date]
    @reflection = Reflection.new
  end

  def create
    reflection = Reflection.new(reflection_params)
    reflection.schedule_id = params[:schedule_id]
    reflection.save
    redirect_to calendars_path
  end

  def show
    @reflection = Reflection.find(params[:id])
  end

  def edit
    @reflection = Reflection.find(params[:id])
  end

  def destroy
    reflection = Reflection.find(params[:id])
    reflection.destroy
    redirect_to calendars_path
  end

  def update
    reflection = Reflection.find(params[:id])
    reflection.update(reflection_params)
    redirect_to calendars_path
  end

  private

  def reflection_params
    params.require(:reflection).permit(:title, :content, images: [])
  end
end
