class VotesController < ApplicationController
  def create
    service = CreateVoteService.new(get_votable, current_user, params)
    service.call
    redirect_to session[:back]
  end

  private

  def get_votable
    if params[:votable_type] == "Post"
      votable = Post.find(params[:votable_id])
    else
      votable = Comment.find(params[:votable_id])
    end
  end
end