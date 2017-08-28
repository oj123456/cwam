# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170828100842) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertisments", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "url"
    t.integer  "location"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["location"], name: "index_advertisments_on_location", using: :btree
  end

  create_table "competitions", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "slug"
    t.string   "url"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["slug"], name: "index_competitions_on_slug", using: :btree
  end

  create_table "dish_types", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "slug"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["slug"], name: "index_dish_types_on_slug", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "slug"
    t.datetime "start_date"
    t.string   "location"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "tag_line"
    t.string   "image_2_file_name"
    t.string   "image_2_content_type"
    t.integer  "image_2_file_size"
    t.datetime "image_2_updated_at"
    t.datetime "end_date"
    t.boolean  "on_homepage"
    t.boolean  "show_time"
    t.index ["on_homepage"], name: "index_events_on_on_homepage", using: :btree
    t.index ["slug", "on_homepage"], name: "index_events_on_slug_and_on_homepage", using: :btree
    t.index ["slug"], name: "index_events_on_slug", using: :btree
  end

  create_table "homepage_images", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "interactive_images", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "url"
    t.integer  "location"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "order",              default: 0
    t.index ["location", "order"], name: "index_interactive_images_on_location_and_order", using: :btree
    t.index ["location"], name: "index_interactive_images_on_location", using: :btree
    t.index ["order"], name: "index_interactive_images_on_order", using: :btree
  end

  create_table "interview_questions", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "interview_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "order",        default: 0
    t.index ["interview_id", "order"], name: "index_interview_questions_on_interview_id_and_order", using: :btree
    t.index ["interview_id"], name: "index_interview_questions_on_interview_id", using: :btree
    t.index ["order"], name: "index_interview_questions_on_order", using: :btree
  end

  create_table "interviews", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "slug"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "position"
    t.string   "horizontal_image_file_name"
    t.string   "horizontal_image_content_type"
    t.integer  "horizontal_image_file_size"
    t.datetime "horizontal_image_updated_at"
    t.boolean  "on_homepage"
    t.index ["on_homepage"], name: "index_interviews_on_on_homepage", using: :btree
    t.index ["slug", "on_homepage"], name: "index_interviews_on_slug_and_on_homepage", using: :btree
    t.index ["slug"], name: "index_interviews_on_slug", using: :btree
  end

  create_table "kitchen_helpers", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "slug"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["slug"], name: "index_kitchen_helpers_on_slug", using: :btree
  end

  create_table "main_ingredients", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "slug"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["slug"], name: "index_main_ingredients_on_slug", using: :btree
  end

  create_table "meal_times", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "slug"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["slug"], name: "index_meal_times_on_slug", using: :btree
  end

  create_table "occasions", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "slug"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["slug"], name: "index_occasions_on_slug", using: :btree
  end

  create_table "place_categories", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "places", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "slug"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.boolean  "is_favorite"
    t.boolean  "is_new"
    t.integer  "place_type"
    t.integer  "place_category_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["place_category_id"], name: "index_places_on_place_category_id", using: :btree
    t.index ["place_type"], name: "index_places_on_place_type", using: :btree
    t.index ["slug", "place_type", "place_category_id"], name: "places_all", using: :btree
    t.index ["slug"], name: "index_places_on_slug", using: :btree
  end

  create_table "press_releases", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "slug"
    t.string   "url"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.index ["slug"], name: "index_press_releases_on_slug", using: :btree
  end

  create_table "recipe_dish_types", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "dish_type_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["dish_type_id"], name: "index_recipe_dish_types_on_dish_type_id", using: :btree
    t.index ["recipe_id", "dish_type_id"], name: "recipe_dish_types_all", using: :btree
    t.index ["recipe_id"], name: "index_recipe_dish_types_on_recipe_id", using: :btree
  end

  create_table "recipe_kitchen_helpers", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "kitchen_helper_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["kitchen_helper_id"], name: "index_recipe_kitchen_helpers_on_kitchen_helper_id", using: :btree
    t.index ["recipe_id", "kitchen_helper_id"], name: "recipe_kitchen_helper_all", using: :btree
    t.index ["recipe_id"], name: "index_recipe_kitchen_helpers_on_recipe_id", using: :btree
  end

  create_table "recipe_main_ingredients", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "main_ingredient_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["main_ingredient_id"], name: "index_recipe_main_ingredients_on_main_ingredient_id", using: :btree
    t.index ["recipe_id", "main_ingredient_id"], name: "recipe_main_ingredients_all", using: :btree
    t.index ["recipe_id"], name: "index_recipe_main_ingredients_on_recipe_id", using: :btree
  end

  create_table "recipe_meal_times", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "meal_time_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["meal_time_id"], name: "index_recipe_meal_times_on_meal_time_id", using: :btree
    t.index ["recipe_id", "meal_time_id"], name: "recipe_meal_times_all", using: :btree
    t.index ["recipe_id"], name: "index_recipe_meal_times_on_recipe_id", using: :btree
  end

  create_table "recipe_occasions", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "occasion_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["occasion_id"], name: "index_recipe_occasions_on_occasion_id", using: :btree
    t.index ["recipe_id", "occasion_id"], name: "recipe_occasions_all", using: :btree
    t.index ["recipe_id"], name: "index_recipe_occasions_on_recipe_id", using: :btree
  end

  create_table "recipe_reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.decimal  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id", "user_id"], name: "recipe_reviews_all", using: :btree
    t.index ["recipe_id"], name: "index_recipe_reviews_on_recipe_id", using: :btree
    t.index ["user_id"], name: "index_recipe_reviews_on_user_id", using: :btree
  end

  create_table "recipe_spices", force: :cascade do |t|
    t.integer  "recipe_id"
    t.integer  "spice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id", "spice_id"], name: "recipe_spices_all", using: :btree
    t.index ["recipe_id"], name: "index_recipe_spices_on_recipe_id", using: :btree
    t.index ["spice_id"], name: "index_recipe_spices_on_spice_id", using: :btree
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "code"
    t.string   "title"
    t.string   "description"
    t.string   "slug"
    t.string   "serving"
    t.string   "timing"
    t.integer  "level"
    t.string   "hero_ingredient"
    t.string   "hero_ingredient_text"
    t.string   "ingredients"
    t.string   "method_of_preparation"
    t.boolean  "recipe_of_the_week"
    t.boolean  "recipe_of_the_month"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.decimal  "reviews_average",               default: "0.0"
    t.integer  "reviews_count",                 default: 0
    t.string   "horizontal_image_file_name"
    t.string   "horizontal_image_content_type"
    t.integer  "horizontal_image_file_size"
    t.datetime "horizontal_image_updated_at"
    t.index ["recipe_of_the_month"], name: "index_recipes_on_recipe_of_the_month", using: :btree
    t.index ["recipe_of_the_week"], name: "index_recipes_on_recipe_of_the_week", using: :btree
    t.index ["slug", "recipe_of_the_week", "recipe_of_the_month"], name: "recipes_all", using: :btree
    t.index ["slug"], name: "index_recipes_on_slug", using: :btree
  end

  create_table "seo_data", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "keywords"
    t.integer  "page"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "spices", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "slug"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "spice_type"
    t.index ["slug"], name: "index_spices_on_slug", using: :btree
  end

  create_table "user_favorite_recipes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_user_favorite_recipes_on_recipe_id", using: :btree
    t.index ["user_id", "recipe_id"], name: "user_favorite_recipes_all", using: :btree
    t.index ["user_id"], name: "index_user_favorite_recipes_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.string   "first_name"
    t.string   "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
