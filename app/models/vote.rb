class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  validates :votable_id, uniqueness: { scope: :user_id }
  validates :user_id, uniqueness: { scope: :votable_id }
end
