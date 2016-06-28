class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def log_in(user)
    session[:user_id] = user.id
    @current_user = user
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

  helper_method :logged_in?
  def logged_in?
    current_user.present?
  end

  private

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "You must login to complete that action."
      redirect_to login_url
    end
  end

  helper_method :current_user
  def current_user
    user_id = session[:user_id] || cookies.signed[:user_id]
    @current_user ||= User.find_by(id: user_id) if user_id
  end

  def correct_user
    @user = User.find(params[:id])
    if current_user != @user
      redirect_to(root_url)
    end
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end
end