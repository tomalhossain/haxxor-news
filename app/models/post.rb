class Post < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :url, presence: true
  default_scope -> { order(created_at: :desc) } 
end
