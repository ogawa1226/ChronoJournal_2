class ReflectionsController < ApplicationController
  def index
  end

  def new
    @date = params[:date]
    @reflection = Reflection.new(schedule_id: params[:schedule_id])
  end

  def create
    @reflection = Reflection.new(reflection_params)
    @reflection.schedule_id = params[:schedule_id]
    @reflection.user_id = current_user.id
    # tag_list = params[:reflection][:tag].split(',')
    if @reflection.save
      flash[:notice] = "投稿に成功しました。"
      @reflection.save_tags(params[:reflection][:tag])
      redirect_to schedules_path(date: @reflection.schedule.start_time.strftime("%Y-%m-%d"))
    else
      render :new
    end
  end

  def show
    @reflection = Reflection.find(params[:id])
    @tag = @reflection.tags.pluck(:name)
    @reflection_tags = @reflection.tags
  end

  def edit
    @reflection = Reflection.find(params[:id])
    @tag = @reflection.tags.pluck(:name)
  end

  def destroy
    reflection = Reflection.find(params[:id])
    reflection.destroy
    flash[:notice] = "削除されました。"
    redirect_to schedules_path(date: reflection.schedule.start_time.strftime("%Y-%m-%d"))
  end

  def update
    @reflection = Reflection.find(params[:id])
    # tag_list = params[:reflection][:tag].split(',')
    if @reflection.update(reflection_params)
      flash[:notice] = "編集に成功しました。"
      @reflection.images.purge if params[:reflection][:images_delete].to_i == 1 # 画像削除チェック
      @reflection.save_tags(params[:reflection][:tag])
      redirect_to schedules_path(date: @reflection.schedule.start_time.strftime("%Y-%m-%d"))
    else
      flash[:notice] = "編集に失敗しました。"
      render :edit
    end
  end

  def search
    @tags = Tag.all
    @tag = Tag.find(params[:tag_id])
    @reflections = @tag.reflections
  end
  
  private

  def reflection_params
    params.require(:reflection).permit(:schedule_id, :title, :content, images: [])
  end
end
