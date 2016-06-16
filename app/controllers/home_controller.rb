class HomeController < ApplicationController
  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 20)
  end
end
