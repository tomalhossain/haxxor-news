class AddUpvoteCountToComments < ActiveRecord::Migration
  def change
    add_column :comments, :upvote_count, :integer, default: 0
  end
end
