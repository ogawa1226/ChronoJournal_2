class SessionsController < ApplicationController
  def index
    redirect_to new_user_registration_path
  end

  def guest_sign_in
    end_user = User.guest
    sign_in end_user
    redirect_to calendars_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
