ActiveRecord::Schema.define(version: 20160624220218) do

  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text     "content",          null: false
    t.integer  "commentable_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "user_id"
    t.string   "commentable_type"
  end

  add_index "comments", ["commentable_id", "created_at"], name: "index_comments_on_commentable_id_and_created_at", using: :btree
  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "url",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                              null: false
    t.string   "email",                             null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest",                   null: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "remember_digest"
    t.boolean  "admin"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end
  
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_foreign_key "comments", "posts", column: "commentable_id"
end
