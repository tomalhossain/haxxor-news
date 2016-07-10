class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :commentable, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
    add_index :comments, [:commentable_id, :created_at]
  end
end
