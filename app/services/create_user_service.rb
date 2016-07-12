class CreateUserService

  def self.digest(token)
    if ActiveModel::SecurePassword.min_cost
      cost = BCrypt::Engine::MIN_COST
    else
      cost = BCrypt::Engine.cost
    end
    BCrypt::Password.create(token, cost: cost)
  end

  def initialize(user_params)
    @user = User.new(user_params)
  end

  def call
    if @user.save
      token = SecureRandom.urlsafe_base64
      @user.update_attributes({ activation_token: token,
                                activation_digest: CreateUserService.digest(token)
      })
      #UserMailer.account_activation(@user).deliver_now
      true
    else
      false
    end
  end

  def get_user
    @user
  end

end

