class CommentsController < ApplicationController
before_action :logged_in_user, only: [:create]

def create 

  @comment = current_user.comments.build(comment_params)

end 




def comment_params
  params.require(:comment).permit(:content)
end
