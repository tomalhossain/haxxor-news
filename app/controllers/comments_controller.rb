class CommentsController < ApplicationController
before_action :logged_in_user, only: [:create]

  def new
  end 

  def create 
    binding.pry
    post = Post.find(params[:format])
    comment = post.comments.build(comment_params)
    comment.update_attributes(user_id: current_user.id)
    comment.save
    redirect_to post 
  end 

  def comment_params
    params.require(:comment).permit(:content)
  end

end 


