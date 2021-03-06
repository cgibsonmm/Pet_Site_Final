class CommentsController < ApplicationController
  before_action :set_photo_post, only: [:create]

  def create
    @comment = @photo_post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html { redirect_to photo_posts_path }
        format.js
      end
    else
      flash[:error] = 'Cannot add comment.'
      rediect_to @photo_post
    end
  end

  private

  def set_photo_post
    @photo_post = PhotoPost.find(params[:photo_post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
