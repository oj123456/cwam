class AddIndexes < ActiveRecord::Migration[5.0]
  def change
    #Ads
    add_index :advertisments, :location

    #Competition
    add_index :competitions, :slug

    #dish_types
    add_index :dish_types, :slug

    #event
    add_index :events, :slug
    add_index :events, :on_homepage
    add_index :events, [:slug, :on_homepage]

    #interactive_images
    add_index :interactive_images, :location
    add_index :interactive_images, :order
    add_index :interactive_images, [:location, :order]

    #interview_questions
    add_index :interview_questions, :interview_id
    add_index :interview_questions, :order
    add_index :interview_questions, [:interview_id, :order]

    #interviews
    add_index :interviews, :slug
    add_index :interviews, :on_homepage
    add_index :interviews, [:slug, :on_homepage]

    #kitchen_helpers
    add_index :kitchen_helpers, :slug

    #main_ingredients
    add_index :main_ingredients, :slug

    #meal_times
    add_index :meal_times, :slug

    #occasions
    add_index :occasions, :slug

    #places
    add_index :places, :slug
    add_index :places, :place_type
    add_index :places, :place_category_id
    add_index :places, [:slug, :place_type, :place_category_id], name: 'places_all'

    #press_release
    add_index :press_releases, :slug

    #recipe_dish_type
    add_index :recipe_dish_types, :recipe_id
    add_index :recipe_dish_types, :dish_type_id
    add_index :recipe_dish_types, [:recipe_id, :dish_type_id], name: 'recipe_dish_types_all'

    #recipe_kitchen_helper
    add_index :recipe_kitchen_helpers, :recipe_id
    add_index :recipe_kitchen_helpers, :kitchen_helper_id
    add_index :recipe_kitchen_helpers, [:recipe_id, :kitchen_helper_id], name: 'recipe_kitchen_helper_all'

    #recipe_main_ingredients
    add_index :recipe_main_ingredients, :recipe_id
    add_index :recipe_main_ingredients, :main_ingredient_id
    add_index :recipe_main_ingredients, [:recipe_id, :main_ingredient_id], name: 'recipe_main_ingredients_all'

    #recipe_meal_times
    add_index :recipe_meal_times, :recipe_id
    add_index :recipe_meal_times, :meal_time_id
    add_index :recipe_meal_times, [:recipe_id, :meal_time_id], name: 'recipe_meal_times_all'

    #recipe_occasions
    add_index :recipe_occasions, :recipe_id
    add_index :recipe_occasions, :occasion_id
    add_index :recipe_occasions, [:recipe_id, :occasion_id], name: 'recipe_occasions_all'

    #recipe_occasions
    add_index :recipe_reviews, :recipe_id
    add_index :recipe_reviews, :user_id
    add_index :recipe_reviews, [:recipe_id, :user_id], name: 'recipe_reviews_all'

    #recipe_spices
    add_index :recipe_spices, :recipe_id
    add_index :recipe_spices, :spice_id
    add_index :recipe_spices, [:recipe_id, :spice_id], name: 'recipe_spices_all'

    #recipe
    add_index :recipes, :slug
    add_index :recipes, :recipe_of_the_week
    add_index :recipes, :recipe_of_the_month
    add_index :recipes, [:slug, :recipe_of_the_week, :recipe_of_the_month], name: 'recipes_all'

    #spices
    add_index :spices, :slug

    #user_favorite_recipes
    add_index :user_favorite_recipes, :user_id
    add_index :user_favorite_recipes, :recipe_id
    add_index :user_favorite_recipes, [:user_id, :recipe_id], name: 'user_favorite_recipes_all'
  end
end
