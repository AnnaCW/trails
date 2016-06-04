class TrailsController < ApplicationController
  before_action :set_trail, only: [:show, :update, :edit, :destroy]

  def index
    @trails = Trail.all
  end

  def new
    @user = User.find(params[:user_id])
    @trail = @user.trails.new
  end

  def create
    @user = User.find(params[:user_id])
    @trail = @user.trails.new(trail_params)
      if @trail.save
        redirect_to @trail
      else
        render :new
      end
  end

  def show
  end

  def edit
  end

  def update
    if @trail.update(trail_params)
      redirect_to @trail
    else
      render :edit
    end
  end

  def destroy
    @trail.delete
    redirect_to trails_path
  end


private

  def trail_params
    params.require(:trail).permit(:name, :image_path, :city, :state)
  end

  def set_trail
    @trail = Trail.find(params[:id])
  end

end
