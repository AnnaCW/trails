class TrailsController < ApplicationController

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
        flash.now[:error] = "#{@tool.errors.full_messages.join(", ")}"
        render :new
      end
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def edit
    @trail = Trail.find(params[:id])
    if current_user == User.find(@trail.user_id)
      @user = current_user
    else
      render file: '/public/404'
    end
  end

  def update
    @trail = Trail.find(params[:id])
    if @trail.update(trail_params)
      redirect_to @trail
    else
      render :edit
    end
  end

  def destroy
    @trail = Trail.find(params[:id])
    if current_user == @trail.user
      @trail.delete
      redirect_to trails_path
    else
      render file: '/public/404'
    end
  end


private

  def trail_params
    params.require(:trail).permit(:name, :image_path, :city, :state, :description, :tags)
  end

end
