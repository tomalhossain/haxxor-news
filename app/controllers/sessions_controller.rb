class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated? 
        log_in user
        if params[:session][:remember_me] == '1' 
          remember(user) 
        end 
        redirect_back_or user
      else
        flash[:warning] = 'Account not activated. Check your email for 
        the activation link.'
        redirect_to root_url 
      end 
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def remember(user) 
    user.remember
    cookies.permanent.signed[:user_id] = user.id 
    cookies.permanent[:remember_token] = user.remember_token
  end 

  def destroy
    log_out if logged_in? 
    redirect_to root_url
  end
end
