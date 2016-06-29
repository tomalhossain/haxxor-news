class VotesController < ApplicationController
  def create
    @post = Post.find(params[:votable_id])
    commentable = get_commentable
    vote = commentable.votes.build

    if vote.update_attributes(vote_params)
      respond_to do |format|
        format.html { redirect_to @upvote.post }
        format.js # we'll use this later for AJAX!
      end
      if (params[:value] == "1")
        commentable.update_attributes(upvote_count: commentable.upvote_count + 1)
      #else
        #commentable.downvote_count += 1
      end
    end

    #redirect_to params[:redir_path]

    binding.pry

    redirect_to root_url
  end

  def destroy
  end

  private

  def vote_params
    params.permit(:value, :user_id, :votable_type, :votable_id)
  end

  def get_commentable
    if params[:comment_id].present?
      commentable = Comment.find(params[:comment_id])
    else
      commentable = @post
    end
  end
end
