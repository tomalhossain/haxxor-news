class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    @post = Post.find(params[:comment][:post_id])
    comment = commentable.comments.build
    if !comment.update_attributes(comment_params)
      flash[:danger] = "Comment may not be empty."
    end
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end

  def commentable
    @commentable ||= if params[:comment][:comment_id].present?
      Comment.find(params[:comment][:comment_id])
    else
      @post
    end
  end
end