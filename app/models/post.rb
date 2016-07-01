class Post < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy
  belongs_to :user
  validates :title, :url, :user, presence: true
end