class User < ActiveRecord::Base
  
  attr_accessor :remember_token, :activation_token, :reset_token 

  before_save :downcase_email

  has_many :posts, dependent: :destroy
  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, on: :create


  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil? 
    BCrypt::Password.new(digest).is_password?(token)
  end 

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end 

  def forget 
    update_attribute(:remember_digest, nil)
  end 

  def activate 
    update_attributes({ activated: true, activate_at: Time.zone.now })
  end 

  def add_reset_digest
    @user.reset_token = new_token
    @user.reset_digest = User.digest(reset_token)
    @user.reset_sent_at = Time.zone.now
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end 

  def create_reset_digest
    self.reset_token = User.new_token
    update_attributes({ reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now })
  end 

  private 

  def downcase_email
    self.email = email.downcase
  end 
end