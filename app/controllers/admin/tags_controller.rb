class Admin::TagsController < Admin::BaseController

  def index
    @tags = Tag.all
  end

  # def new
  #   @admin = current_user
  #   @tag = Tag.new
  # end
  #
  # def create
  #   @admin = current_user
  #   @tag = Tag.new(tag_params)
  #   if @tag.save
  #     redirect_to :admin_tags_path
  #   else
  #     render :new
  #   end
  # end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

end
