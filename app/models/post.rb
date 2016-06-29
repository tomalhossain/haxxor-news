class Post < ActiveRecord::Base
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy
  belongs_to :user
  validates :title, presence: true
  validates :url, presence: true
  validates :user, presence: true
<<<<<<< 49913075928bca61bf3b77bb1638f39f099e37cd
=======

  def score
  end

>>>>>>> Basic upvoting functional for articles. JavaScript for color change not implemented yet as well as validations for user uniqueness.
end