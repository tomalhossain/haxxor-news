class Vote < ActiveRecord::Base

  belongs_to :votable, polymorphic: true#, counter_cache: true

end
