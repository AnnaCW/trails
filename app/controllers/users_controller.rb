class UsersController < ApplicationController

  def index
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_trails_path(@user)
    else
      render :new
    end
  end

  def show
  end

private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

end
