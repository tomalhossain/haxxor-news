class CommentsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def create
    post = Post.find(params[:comment][:post_id])
    if params[:comment][:comment_id].present?
      parent = Comment.find(params[:comment][:comment_id])
    else
      parent = post
    end
    comment = parent.comments.build
    if !comment.update_attributes(comment_params)
      flash[:danger] = "Comment may not be empty."
    end
    redirect_to post
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end

end