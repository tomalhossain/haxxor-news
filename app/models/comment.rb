class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :post_id, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
  default_scope -> { order(created_at: :desc) }
end
