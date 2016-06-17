class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user=nil
  end

  private

  def logged_in_user
    unless logged_in?
      flash[:danger] = "You must log in in order to submit a post."
      redirect_to login_url
    end
  end
end