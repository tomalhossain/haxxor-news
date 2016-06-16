module PostsHelper

  private 

  def logged_in_user
    unless logged_in? 
      flash[:danger] = "You must log in in order to submit a post."
      redirect_to login_url 
    end 
  end 
end 