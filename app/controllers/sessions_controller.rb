class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user.id), notice: 'すでにログインしています' if logged_in?
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id), notice: 'ログインしました'
    else
      redirect_to new_session_path, notice: 'ログインに失敗しました'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to new_session_path
  end
end
