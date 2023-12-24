class SchedulesController < ApplicationController

  def index
    @date = params[:date] ||= Date.today.to_s
    @schedules = current_user.schedules.where(start_time: DateTime.parse(@date).in_time_zone('Asia/Tokyo').all_day)

    # 自分のスケージュールのIDをすべて取得
    schedule_ids = current_user.schedules.ids
    # 自分のスケジュールに紐づく振り返りのIDほすべて取得
    reflection_ids = Reflection.where(schedule_id: schedule_ids).ids
    # 自分の振り返りに紐づくタグ名を配列として取得
    reflection_tags = ReflectionTag.where(reflection_id: reflection_ids).map{|tag| tag.tag.name}
    # タグ配列の重複回数をカウントして、@tagsに[[tagName, count], [tagName, count]]の形式で詰め込む
    @tags = reflection_tags.group_by(&:itself).map{ |key, value| [key, value.count] }.to_a

    # @tags = []
    # current_user.schedules.each do |s|
    #   pp "-----"
    #   pp s
    #   s.reflections.each do |r|
    #     @tags << r.tags
    #   end
    # end

    # pp "-----------------------"
    # pp @tags



  end

  def new
    @date = params[:date]
    @schedule = Schedule.new
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
     @schedule.save
      redirect_to calendars_path
    # else
    #   @schedules = Schedule.all
    #   render :new
    # end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @date = params[:date]
    @schedule = Schedule.find(params[:id])
  end

  def update
    @schedule = Schedule.find(params[:id])
    if @schedule.update(schedule_params)
      redirect_to calendars_path
    else
      render :edit
    end
  end

  def destroy
    schedule = Schedule.find(params[:id])
    schedule.destroy
    redirect_to calendars_path
  end



  private

  def schedule_params
    params.require(:schedule).permit(:user_id, :category_id, :day, :title, :start_time, :end_time, :all_day, :memo)
  end
end
