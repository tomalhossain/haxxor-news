class FixCommentReferences < ActiveRecord::Migration
  def change
    remove_reference :comments, :commentable
    add_reference :comments, :commentable, index: true
  end
end

