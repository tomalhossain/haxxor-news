class User < ActiveRecord::Base

  attr_accessor :remember_token, :activation_token, :reset_token

  before_save :downcase_email

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy 
  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def remember
    self.remember_token = CreateUserService.new_token
    update_attribute(:remember_digest, CreateUserService.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def activate
    update_attributes({ activated: true, activated_at: Time.zone.now })
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end