class RecipeController < ApplicationController
  def index
    page_seo = SeoData.where(page: SeoData.pages[:recipes]).first
    @page_title = page_seo.title
    fill_seo(page_seo.title, page_seo.description, page_seo.keywords, page_seo.image.url)

    @advertisment = Advertisment.where(location: Advertisment.locations[:recipes_page]).order("RANDOM()").first
    @dish_types = DishType.all.order(:title)
    @main_ingredients = MainIngredient.all.order(:title)
    @occasions = Occasion.all.order(:title)
    @meals_courses = MealTime.all.order(:title)

  end

  def listing
    page_seo = SeoData.where(page: SeoData.pages[:recipes]).first
    @page_title = page_seo.title
    fill_seo(page_seo.title, page_seo.description, page_seo.keywords, page_seo.image.url)

    filters = {}
    pagination = {:limit => -1, :offset => -1}
    if params[:dish_type].present?
      filters[:dish_type] = params[:dish_type]
    end
    if params[:main_ingredient].present?
      filters[:main_ingredient] = params[:main_ingredient]
    end
    if params[:occasion].present?
      filters[:occasion] = params[:occasion]
    end
    if params[:meal_time].present?
      filters[:meal_time] = params[:meal_time]
    end
    if params[:spice].present?
      filters[:spice] = params[:spice]
    end
    if params[:kitchen_helper].present?
      filters[:kitchen_helper] = params[:kitchen_helper]
    end

    @recipes, @filtered_by = Recipe.filter_recipes(filters, pagination)

    if @recipes.count == 0
      @have_recipes = false
      @recipes = Recipe.order("RANDOM()").take(8)
    else
      @have_recipes = true
    end
  end

  def show
    if params[:slug]
      @recipe = Recipe.where(slug: params[:slug]).first
    end

    if !@recipe
      redirect_to root_path
    else
      @page_title = @recipe.title
      @advertisment = Advertisment.where(location: Advertisment.locations[:recipe_inner_page]).order("RANDOM()").first
      if current_user
        @user_review = RecipeReview.where(user_id: current_user.id, recipe_id: @recipe.id).first
      end
      fill_seo(@recipe.title,@recipe.description, "", @recipe.image.url)
    end
  end

  def autofill_search
    recipes = []
    if params[:title]
      recipes = Recipe.where("title ILIKE ?", "%#{params[:title]}%")
    end
    render json: Presenters::CollectionPresenter.new( Presenters::RecipePresenter, recipes)
  end
end
