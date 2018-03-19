class PhotoPostsController < ApplicationController
  def index
  end

  def new
    @photo_post = PhotoPost.new
  end

  def create
    @photo_post = current_user.photo_posts.build(post_params)
    if @photo_post.save
      flash[:success] = "Successfully, created post"
      redirect_to @photo_post
    end
  end

  def show
    @photo_post = PhotoPost.find(params[:id])
  end

  private

  def post_params
    params.require(:photo_post).permit(:image, :caption)
  end
end
