class Vote < ActiveRecord::Base
  belongs_to :votable, polymorphic: true
  validates :votable, :user_id, :value, presence: true
  validates :user_id, uniqueness: { scope: [:votable_id, :votable_type] }
  validates :value, inclusion: { in: [-1,1] }
end
