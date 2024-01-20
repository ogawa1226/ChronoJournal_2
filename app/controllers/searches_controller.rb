class SearchesController < ApplicationController

  def search
    @tags = Tag.all
    @range = params[:range]
    @word = params[:word]

    if @range == "Schedule"
      @schedules = current_user.schedules.looks(params[:word])
    else
      @reflections = current_user.reflections.looks(params[:word])
    end
  end

  def search_tag
    # タグを取得
    @tag = Tag.find(params[:tag_id])
    # タグに紐づいた自分自身の振り返りを取得して、そのスケジュールIDを配列で取得し、重複を取り除く(uniq)
    reflections = @tag.reflections.joins(:schedule).where(schedule: {user_id: current_user.id}).pluck(:schedule_id).uniq
    # スケジュールから、振り返りに使われているスケジュールIDを配列で渡す(SQL: WHERE INで検索している)
    @schedules = Schedule.where(id: reflections)
  end
end