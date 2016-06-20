class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user=nil
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end 


  helper_method :current_user
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end 
    end 
  end

  helper_method :logged_in? 
  def logged_in?
    !current_user.nil?
  end

  private

  def logged_in_user
    unless logged_in?
      flash[:danger] = "You must log in in order to submit a post."
      redirect_to login_url
    end
  end
end