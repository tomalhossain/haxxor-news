class Comment < ActiveRecord::Base
  has_many :comments, as: :commentable 
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  #validates :commentable_type, presence: true
  #validates :commentable_id, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
  default_scope -> { order(created_at: :desc) }
end
