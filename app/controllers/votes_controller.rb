class VotesController < ApplicationController
  def create
    @post = Post.find(params[:votable_id])
    votable = get_votable
    vote = votable.votes.build
    if vote.update_attributes(vote_params)
      if (params[:value] == "+1")
        votable.update_attributes(upvote_count: votable.upvote_count + 1)
      else
        votable.update_attributes(downvote_count: votable.downvote_count + 1)
      end
    else
      flash[:danger] = "Not a valid voting request."
    end
    redirect_path
  end

  def destroy
  end

  private

  def redirect_path

    if params[:redir_path] == "root_url"
      redirect_to root_url
    end
  end

  def vote_params
    params.permit(:value, :user_id, :votable_type, :votable_id)
  end

  def get_votable
    if params[:comment_id].present?
      votable = Comment.find(params[:comment_id])
    else
      votable = @post
    end
  end
end
