class PhotoPostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :crop]
  before_action :post_owner?, only: [:edit, :update, :destroy]

  def index
    @posts = PhotoPost.order('created_at DESC')
  end

  def new
    @photo_post = PhotoPost.new
  end

  def create
    @photo_post = current_user.photo_posts.build(post_params)
    if @photo_post.save
      flash[:success] = "Successfully, created post take a few seconds and crop it."
      render 'crop'
    else
      flash[:error] = "Error, creating post"
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def crop
    render 'crop'
  end

  def update
    @photo_post.update(update_params)
    @photo_post.save
    flash[:success] = 'Post Updated'
    redirect_to @photo_post
   end

  private

  def post_owner?
    @photo_post = PhotoPost.find(params[:id])
    unless current_user.id == @photo_post.user_id
      flash[:error] = 'You must own post to edit.'
      redirect_to @photo_post
    end
  end

  def set_post
    @photo_post = PhotoPost.find(params[:id])
  end

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
      :image_crop_h,
      :image_box_w,
      :image_aspect,
      :caption
    )
  end
end
