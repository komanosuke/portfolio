# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_05_30_053528) do

  create_table "admins", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "article_cats", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "articles", force: :cascade do |t|
    t.integer "article_cat_id", null: false
    t.string "title", null: false
    t.string "image", null: false
    t.string "image_title", null: false
    t.text "text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_cat_id"], name: "index_articles_on_article_cat_id"
  end

  create_table "cart_works", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "work_id", null: false
    t.string "status"
    t.string "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_works_on_cart_id"
    t.index ["work_id"], name: "index_cart_works_on_work_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "quantity"
    t.string "status"
    t.string "discount"
    t.string "session_id"
    t.string "coupon_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "content", null: false
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone_number", null: false
    t.integer "subject", default: 0, null: false
    t.text "message", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lifecosts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "twenty", null: false
    t.integer "thirty", null: false
    t.integer "forty", null: false
    t.integer "fifty", null: false
    t.integer "sixty", null: false
    t.integer "marriage", null: false
    t.integer "child", null: false
    t.integer "house", null: false
    t.integer "car", null: false
    t.integer "care", null: false
    t.integer "rent", null: false
    t.integer "utility", null: false
    t.integer "internet", null: false
    t.integer "insurance", null: false
    t.integer "car_cost", null: false
    t.integer "child_care", null: false
    t.integer "lesson", null: false
    t.integer "transport", null: false
    t.integer "pocket_money", null: false
    t.integer "other_cost", null: false
    t.integer "food", null: false
    t.integer "necessity", null: false
    t.integer "medical_cost", null: false
    t.integer "child_lesson", null: false
    t.integer "clothes", null: false
    t.integer "beauty", null: false
    t.integer "companionship", null: false
    t.integer "entertainment", null: false
    t.integer "small_cost", null: false
    t.integer "exception", null: false
    t.integer "marriage_total", null: false
    t.integer "child_total", null: false
    t.integer "house_total", null: false
    t.integer "car_total", null: false
    t.integer "tax", null: false
    t.integer "pension", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_lifecosts_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id", "post_id"], name: "index_likes_on_user_id_and_post_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "news", force: :cascade do |t|
    t.integer "news_cat_id", null: false
    t.string "title", null: false
    t.string "image", null: false
    t.string "image_title", null: false
    t.text "text", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["news_cat_id"], name: "index_news_on_news_cat_id"
  end

  create_table "news_cats", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "content", null: false
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "followed_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "study_records", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "grade1", null: false
    t.text "grade2", null: false
    t.text "grade3", null: false
    t.text "grade4", null: false
    t.text "grade5", null: false
    t.text "grade6", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_study_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "zip", null: false
    t.string "prefecture", null: false
    t.string "city", null: false
    t.string "street", null: false
    t.string "address"
    t.string "tel", null: false
    t.string "image"
    t.string "photo"
    t.string "audio"
    t.string "video"
    t.text "profile"
    t.string "remember_digest"
    t.string "activation_digest"
    t.boolean "activated"
    t.datetime "activated_at"
    t.string "reset_digest"
    t.datetime "reset_sent_at"
    t.text "introduction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "work_cats", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "works", force: :cascade do |t|
    t.integer "work_cat_id", null: false
    t.string "title", null: false
    t.string "image", null: false
    t.integer "price", null: false
    t.text "text", null: false
    t.integer "onlyone", null: false
    t.integer "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["work_cat_id"], name: "index_works_on_work_cat_id"
  end

  add_foreign_key "articles", "article_cats"
  add_foreign_key "cart_works", "carts"
  add_foreign_key "cart_works", "works"
  add_foreign_key "carts", "users"
  add_foreign_key "comments", "posts"
  add_foreign_key "comments", "users"
  add_foreign_key "lifecosts", "users"
  add_foreign_key "likes", "posts"
  add_foreign_key "likes", "users"
  add_foreign_key "news", "news_cats"
  add_foreign_key "posts", "users"
  add_foreign_key "relationships", "users", column: "followed_id"
  add_foreign_key "relationships", "users", column: "follower_id"
  add_foreign_key "study_records", "users"
  add_foreign_key "works", "work_cats"
end
