class CategoriesController < ApplicationController
  
  def show
    @schedules = Schedule.where(category_id: params[:id])
    @category = Category.find(params[:id])
  end
  
end
