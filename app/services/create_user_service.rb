class CreateUserService 
  def initialize(user_params)
    @user = User.new(user_params)
  end 

  def call
    if @user.save
      token = SecureRandom.urlsafe_base64
      @user.update_attributes({ activation_token: token, 
                                activation_digest: digest(token)
      })     
      UserMailer.account_activation(@user).deliver_now
      true 
    else 
      success = false
    end 
  end

  def get_user
    @user
  end 

  private 

  def new_token
  end

  def digest(raw_password)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(raw_password, cost: cost)
  end 
end 

