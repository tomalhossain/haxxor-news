class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  validates :votable_id, :votable_type, :user_id, :value, presence: true
  validates :votable_id, uniqueness: { scope: :user_id }
  validates :user_id, uniqueness: { scope: :votable_id }
  validates :value, inclusion: { in: [-1,1] }
end
