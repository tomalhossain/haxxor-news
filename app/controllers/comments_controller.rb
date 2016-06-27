class CommentsController < ApplicationController
before_action :logged_in_user, only: [:create]

  def new
  end

  def create
    @parent_post = Post.find(params[:post_id])
    if params[:comment_id].present?
      parent_comment = Comment.find(params[:comment_id])
      new_comment = parent_comment.comments.build(comment_params)
      new_comment.update_attributes(commentable_type: "Comment")
      create_comment new_comment
    else
      new_comment = @parent_post.comments.build(comment_params)
      new_comment.update_attributes(commentable_type: "Post")
      create_comment new_comment
    end
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  private

  def create_comment(new_comment)
    new_comment.update_attributes(user_id: current_user.id)
    new_comment.save
    redirect_to @parent_post
  end
end