ActiveRecord::Schema.define(version: 20160616143920) do

  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "url",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
