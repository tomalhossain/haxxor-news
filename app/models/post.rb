class Post < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :url, presence: true
  validates :user, presence: true
end