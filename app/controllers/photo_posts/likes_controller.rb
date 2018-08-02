class PhotoPosts::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_photo_post


  def create
    @photo_post.likes.where(user_id: current_user.id).first_or_create

    respond_to do |format|
      format.html { redirect_to @photo_post}
      format.js
    end
  end

  def destroy
    @photo_post.likes.where(user_id: current_user.id).destroy_all

    respond_to do |format|
      format.html { redirect_to @photo_post}
      format.js
    end
  end


  private
    def set_photo_post
      @photo_post = PhotoPost.find(params[:photo_post_id])
    end
end
