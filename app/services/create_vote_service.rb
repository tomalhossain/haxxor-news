class CreateVoteService

  def initialize(votable, current_user, params)
    @votable = votable
    @current_user = current_user
    @params = params
  end

  def call
    type = vote_type
    if type == "standard"
      standard_vote
    elsif type == "swap"
      swap_vote
    else
      neutralize_vote
    end
  end

  private

  def standard_vote
    @votable.votes.create(vote_params)
    if upvote?
      @votable.update_attributes(upvote_count: @votable.upvote_count + 1)
    else
      @votable.update_attributes(downvote_count: @votable.downvote_count + 1)
    end
  end

  def swap_vote
    if upvote?
      @votable.update_attributes({ upvote_count: @votable.upvote_count + 1,
                                   downvote_count: @votable.downvote_count - 1 })
      existing_vote.update_attributes(value: 1)
    else
      @votable.update_attributes({ upvote_count: @votable.upvote_count - 1,
                                   downvote_count: @votable.downvote_count + 1 })
      existing_vote.update_attributes(value: -1)
    end
  end

  def neutralize_vote
    existing_vote.destroy
    if upvote?
      @votable.update_attributes(upvote_count: @votable.upvote_count - 1)
    else
      @votable.update_attributes(downvote_count: @votable.downvote_count - 1)
    end
  end

  def vote_type
    if existing_vote.present?
      if (existing_vote.value == 1 && downvote?) || (existing_vote.value == -1 && upvote?)
        return "swap"
      else
        return "neutralize"
      end
    else
      return "standard"
    end
  end

  def upvote?
    return @params[:value] == "+1"
  end

  def downvote?
    return @params[:value] == "-1"
  end

  def existing_vote
    @vote ||= @votable.votes.where(user_id: @current_user.id).first
  end

  def vote_params
    @params.permit(:value, :votable_type, :votable_id).merge(user_id: @current_user.id)
  end
end
