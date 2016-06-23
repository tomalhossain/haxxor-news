class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  before_action :not_self, only: :destroy

  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 20)
  end

  def new
    @user = User.new
  end

  def create
    service = CreateUserService.new(user_params)
    success = service.call
    if success
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      @user = service.get_user
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    if user == current_user || current_user.admin?
      user.destroy
      flash[:success] = "User deleted"
      redirect_to users_url
    else
      redirect_to(root_url)
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
