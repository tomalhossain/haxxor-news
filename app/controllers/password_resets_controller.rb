class PasswordResetsController < ApplicationController
  def new
    if logged_in?
      redirect_to root_url 
      flash[:message] = "You are already logged in." 
    end 
  end

  def create
    @user = User.find_by(email: params[:password_reset][:email])
    if @user.present? 
      token = SecureRandom.urlsafe_base64 
      @user.update_attributes({ reset_token: token,
                                reset_digest: digest(token) })
      UserMailer.password_reset(@user).deliver_now
      redirect_to root_url 
      flash[:message] = "Please check your email to reset your password."
    else 
      redirect_to new_password_reset_path
      flash[:danger] = "Please provide a valid email address."
    end 
  end 

  def edit
    @user = User.find_by(email: params[:email])
    if !(@user && @user.authenticated?(:reset, params[:id]))    
      flash[:danger] = "Not a valid password reset request."
      redirect_to new_password_reset_path 
    end 
  end

  def update 
    user = User.find(params[:id])
    user.update_attributes(user_params)
    log_in(user)
    redirect_to user
  end 

  private 

  def digest(token)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(token, cost: cost)
  end 

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
