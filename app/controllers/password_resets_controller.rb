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
                                reset_digest: CreateUserService.digest(token) })
      #UserMailer.password_reset(@user).deliver_now
      redirect_to root_url
      flash[:message] = "Please check your email to reset your password."
    else
      redirect_to new_password_reset_path
      flash[:danger] = "Please provide a valid email address."
    end
  end

  def edit
    @user = User.find_by(email: params[:email])
    if !(@user.present? && @user.authenticated?(:reset, params[:id]))
      redirect_to root_url
      flash[:danger] = "Not a valid password reset request."
    end
  end

  def update
    @user = User.find(params[:id])
    if valid_params? && @user.update_attributes(reset_params)
        flash[:success] = "Your password has been successfully reset!"
        log_in(@user)
        redirect_to @user
    else
        flash[:danger] = "You must enter a valid password and confirmation."
        render 'edit'
    end
  end

  private

  def reset_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def valid_params?
    reset_params[:password].present? && user_params[:password_confirmation].present?
  end

end
