class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :post, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :comments, [:post_id, :created_at]  
  end
end
