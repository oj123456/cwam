class UsersController < ApplicationController
  def recipe_box
    if !current_user
      redirect_to new_user_session_path
      return;
    end
    @recipes = Recipe.where(id: (UserFavoriteRecipe.where(user_id: current_user.id).map(&:recipe_id)))
    fill_seo("Recipe box", "User's specific recipe box", "", "")
  end

  def add_to_recipe_box
    result = {}
    if (!current_user)
      result = {code: -1, message: user_must_sign_in}
    else
      if (params[:recipe_id])
        if UserFavoriteRecipe.where(user_id: current_user.id, recipe_id: params[:recipe_id]).count > 0
          result = {code: -2, message: "Already in Recipe box !"}
        else
          if UserFavoriteRecipe.create(user_id: current_user.id, recipe_id: params[:recipe_id]).save!
            result = {code: 1, message: "Added to Recipe box !"}
          else
            result = {code: 0, message: "There was an error while adding it to Recipe box !"}
          end
        end
      end
    end

    render json: result
  end

  def delete_from_recipe_box
    result = {}
    if (!current_user)
      result = {code: -1, message: user_must_sign_in}
    else
      if (params[:recipe_id])
        if UserFavoriteRecipe.where(user_id: current_user.id, recipe_id: params[:recipe_id]).destroy_all.count > 0
          result = {code: 1, message: "Recipe removed from Recipe box !"}
        else
          result = {code: 0, message: "There was an error while deleting it from Recipe box !"}
        end
      end
    end

    render json: result

  end

  def review_recipe
    result = {}
    if (!current_user)
      result = {code: -1, message: user_must_sign_in}
    else
      if (params[:recipe_id])
        recipe_review = RecipeReview.where(user_id: current_user.id, recipe_id: params[:recipe_id]).first_or_create
        recipe_review.rating = params[:rating]
        if recipe_review.save!
          result = {code: 1, message: "Review saved ! #{ reload_page_to_see_updates}"}
        else
          result = {code: 0, message: "There was an error while saving your review !"}
        end
      end
    end

    render json: result
  end

  private
    def user_must_sign_in
      return "You must be <a href=\"#{ new_user_session_path }\">signed in</a> !"
    end
    def reload_page_to_see_updates
      return "Please <a href=\"javascript:reloadPage();\">reload the page</a> to see the updates !"
    end
end
