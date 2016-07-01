class VotesController < ApplicationController
  def create
    @post = Post.find(params[:votable_id])
    service = CreateVoteService.new(get_votable,current_user,params)
    service.call
    redirect_to params[:redir_path]
  end

  private

  def get_votable
    if params[:comment_id].present?
      votable = Comment.find(params[:comment_id])
    else
      votable = @post
    end
  end
end


