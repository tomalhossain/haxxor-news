class UserMailerPreview < ActionMailer::Preview

  def account_activation
    user = User.find(101)
    user.activation_token = SecureRandom.urlsafe_base64 #User.new_token
    UserMailer.account_activation(user)
  end

  def password_reset
    UserMailer.password_reset
  end
end