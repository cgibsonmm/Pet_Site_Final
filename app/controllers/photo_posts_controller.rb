class PhotoPostsController < ApplicationController
  def index
  end

  def new
    @photo_post = PhotoPost.new
  end

  def create
    @photo_post = current_user.photo_posts.build(post_params)
    if @photo_post.save
      flash[:success] = "Successfully, created post take a few seconds and crop it."
      render 'crop'
    end
  end

  def show
    @photo_post = PhotoPost.find(params[:id])
  end

  def crop
    @photo_post = PhotoPost.find(params[:id])
  end

  def update
    @photo_post = PhotoPost.find(params[:id])
    @photo_post.update(update_params)
    @photo_post.save
    flash[:success] = 'Successfully, cropped photo'
    redirect_to @photo_post
  end

  private

  def post_params
    params.require(:photo_post).permit(:image, :caption)
  end

  def update_params
    params.require(:photo_post).permit(
    :image,
    :image_original_w,
    :image_original_h,
    :image_crop_x,
    :image_crop_y,
    :image_crop_w,
    :image_crop_h
  )
  end
end
