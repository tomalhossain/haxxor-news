class VotesController < ApplicationController
  def create
    @post = Post.find(params[:votable_id])
    votable = get_votable

    if votable.votes.where(user_id: current_user.id).present?
      vote = votable.votes.where(user_id: current_user.id).first
      if vote.value == 1
        if (params[:value] == "+1")
          vote.destroy
          votable.update_attributes(upvote_count: votable.upvote_count - 1)
        else
          votable.update_attributes({ upvote_count: votable.upvote_count - 1,
                                      downvote_count: votable.downvote_count + 1 })
          vote.update_attributes(value: -1)
        end
      else
        if (params[:value] == "-1")
          vote.destroy
          votable.update_attributes(downvote_count: votable.downvote_count - 1)
        else
          votable.update_attributes({ upvote_count: votable.upvote_count + 1,
                                      downvote_count: votable.downvote_count - 1 })
          vote.update_attributes(value: 1)
        end
      end
    else
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
    end
    redirect_to params[:redir_path]
  end

  private

  def vote_params
    params.permit(:value, :votable_type, :votable_id).merge(user_id: current_user.id)
  end

  def get_votable
    if params[:comment_id].present?
      votable = Comment.find(params[:comment_id])
    else
      votable = @post
    end
  end
end
