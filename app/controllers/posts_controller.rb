class PostsController < ApplicationController

  
 
  #to render a particular post(s).
  def show
    @post = Post.find(params[:id])
  end
  
  #to return a view with an HTML form to create a new post
  def new
   @post = Post.new 
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

  #to return a view with an HTML form to edit an existing post
  def edit
  end

  #to actually do the updating of said post
  def update
  end

  #to remove a post from the database
  def destroy
  end

  
  #to show a list of all posts - is this even necessary
  #if the index.html.erb file for the home controller
  #essentially already displays a list of all the posts? 
  def index
  end
  


=end

