class TrailsController < ApplicationController

  def index
    @trails = Trail.all
  end

  def new
    @trail = Trail.new
  end

  def create
    @trail = Trail.new(trail_params)
      if @trail.save
        redirect_to @trail
      else
        render :new
      end
  end

  def show
    @trail = Trail.find(params[:id])
  end


private

  def trail_params
    params.require(:trail).permit(:name, :image_path, :city, :state)
  end

end
