class PostsController < ApplicationController
  before_action :logged_in_user, only: [:create]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    current_user
    @post = @current_user.posts.build(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :url)
  end

=begin

Actions for future tasks

  def edit
  end

  def update
  end

  def destroy
  end

=end

end


