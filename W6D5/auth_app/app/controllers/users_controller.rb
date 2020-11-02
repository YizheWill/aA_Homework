class UsersController < ApplicationController
  before_action :require_current_user!, except: [:create, :new]
  before_action :set_user, only: :create

  def create
    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      render json: errors.full_messages
    end
  end

  def new
    @user = User.new
  end

  private

  def set_user
    @user = User.find_by(user_params)
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
