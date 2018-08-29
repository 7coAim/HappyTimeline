class UsersController < ApplicationController
  before_action :login?, only: %i[show edit]

  def top
    render 'top'
  end

  def new
    if logged_in?
      redirect_to user_path(current_user.id), notice: 'すでにログインしています'
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), notice: 'ユーザ登録が完了しました'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id), notice: 'マイページはこちらです' unless @user == current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email,
                                 :password, :password_confirmation, :icon)
  end
end
