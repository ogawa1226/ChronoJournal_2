class CategoriesController < ApplicationController
  
  def show
    @schedules = current_user.schedules.where(category_id: params[:id])
    @category = Category.find(params[:id])
  end
  
end
