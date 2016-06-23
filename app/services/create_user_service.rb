class CreateUserService 
  def initialize(user_params)
    @user = User.new(user_params)
  end 

  def call
    if @user.save
      activation_token = new_token
      reset_token = new_token
      @user.update_attributes({ activation_token: activation_token, 
                                activation_digest: digest(activation_token),
                                reset_token: reset_token, 
                                reset_digest: digest(reset_token) })     
      UserMailer.account_activation(@user).deliver_now
      sucess = true 
    else 
      success = false
    end 
  end

  def get_user
    @user
  end 

  private 

  def new_token
    SecureRandom.urlsafe_base64
  end

  def digest(raw_password)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(raw_password, cost: cost)
  end 
end 

