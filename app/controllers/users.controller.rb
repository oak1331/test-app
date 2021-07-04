class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :show]
  before_action :set_user, only: [:edit, :update, :show]
  before_action :move_to_index, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

  def move_to_index
    redirect_to root_path unless @user.id == current_user.id
  end
end
