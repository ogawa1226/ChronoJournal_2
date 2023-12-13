class SessionsController < ApplicationController
  def guest_sign_in
    end_user = User.guest
    sign_in end_user
    redirect_to calendars_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
