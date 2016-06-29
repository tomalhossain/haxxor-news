class Comment < ActiveRecord::Base

  has_many :comments, as: :commentable
  has_many :votes,    as: :votable

  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :content, :user, :commentable, presence: true

end