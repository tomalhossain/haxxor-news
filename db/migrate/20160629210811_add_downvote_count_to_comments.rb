class AddDownvoteCountToComments < ActiveRecord::Migration
  def change
    add_column :comments, :downvote_count, :integer, default: 0
  end
end
