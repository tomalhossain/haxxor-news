class PostsController < ApplicationController

  #to return a view with an HTML form to create a new post
  def new
  end

  #actually do the creating of said post
  def create
    @post = Post.new(post_params)
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
end
=begin

  These will be filled in later...

  #to show a list of all posts
  def index
  end

  #to render a particular post(s).
  def show
  end

  #to return a view with an HTML form to edit an existing post
  def edit
  end

  #to actually do the updating of said post
  def update
  end

  #to remove a post from the database
  def destroy
  end

=end

