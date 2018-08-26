class UsersController < ApplicationController
  def new
    @user = User.new
    render 'top'
  end
end
