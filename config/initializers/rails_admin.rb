RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan, AdminAbility

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new do
      except ['SeoData']
    end
    export do
      except ['SeoData']
    end

    bulk_delete do
      except ['SeoData']
    end

    show
    edit
    delete do
      except ['SeoData']
    end

    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.main_app_name = ["Cooking with a Manicure", "Admin"]

  config.excluded_models = ["RecipeDishType", "RecipeKitchenHelper", "RecipeMainIngredient", "RecipeMealTime", "RecipeOccasion", "RecipeReview", "RecipeSpice", "UserFavoriteRecipe"]

  config.model User do
    weight 6
  end
  config.model DishType do
    parent Recipe
    weight 0
    configure :description, :wysihtml5  do
      config_options  toolbar: { fa: true }, # use font-awesome instead of glyphicon
        html: true, # enables html editor
        parserRules: { tags: { p:1 } } # support for <p> in html mode
    end
    configure :recipe_dish_types do
      visible(false)
    end
    configure :recipes do
      visible(false)
    end
    configure :slug do
      hide
    end
  end
  config.model KitchenHelper do
    parent Recipe
    weight 6
    configure :description, :wysihtml5  do
      config_options  toolbar: { fa: true }, # use font-awesome instead of glyphicon
        html: true, # enables html editor
        parserRules: { tags: { p:1 } } # support for <p> in html mode
    end
    configure :recipe_kitchen_helpers do
      visible(false)
    end
    configure :recipes do
      visible(false)
    end
    configure :slug do
      hide
    end
  end
  config.model MainIngredient do
    parent Recipe
    weight 2
    configure :description, :wysihtml5  do
      config_options  toolbar: { fa: true }, # use font-awesome instead of glyphicon
        html: true, # enables html editor
        parserRules: { tags: { p:1 } } # support for <p> in html mode
    end
    configure :recipe_main_ingredients do
      visible(false)
    end
    configure :recipes do
      visible(false)
    end
    configure :slug do
      hide
    end
  end
  config.model MealTime do
    parent Recipe
    weight 4
    configure :description, :wysihtml5  do
      config_options  toolbar: { fa: true }, # use font-awesome instead of glyphicon
        html: true, # enables html editor
        parserRules: { tags: { p:1 } } # support for <p> in html mode
    end
    configure :recipe_meal_times do
      visible(false)
    end
    configure :recipes do
      visible(false)
    end
    configure :slug do
      hide
    end
  end
  config.model Occasion do
    parent Recipe
    weight 3
    configure :description, :wysihtml5  do
      config_options  toolbar: { fa: true }, # use font-awesome instead of glyphicon
        html: true, # enables html editor
        parserRules: { tags: { p:1 } } # support for <p> in html mode
    end
    configure :recipe_occasions do
      visible(false)
    end
    configure :recipes do
      visible(false)
    end
    configure :slug do
      hide
    end
  end
  config.model Spice do
    parent Recipe
    weight 5
    configure :description, :wysihtml5  do
      config_options  toolbar: { fa: true }, # use font-awesome instead of glyphicon
        html: true, # enables html editor
        parserRules: { tags: { p:1 } } # support for <p> in html mode
    end
    configure :recipe_spices do
      visible(false)
    end
    configure :recipes do
      visible(false)
    end
    configure :slug do
      hide
    end
  end
  config.model Recipe do
    weight 1
    configure :description, :wysihtml5  do
      config_options  toolbar: { fa: true }, # use font-awesome instead of glyphicon
        html: true, # enables html editor
        parserRules: { tags: { p:1 } } # support for <p> in html mode
    end
    configure :hero_ingredient_text, :wysihtml5  do
      config_options  toolbar: { fa: true }, # use font-awesome instead of glyphicon
        html: true, # enables html editor
        parserRules: { tags: { p:1 } } # support for <p> in html mode
    end
    configure :ingredients, :wysihtml5  do
      config_options  toolbar: { fa: true }, # use font-awesome instead of glyphicon
        html: true, # enables html editor
        parserRules: { tags: { p:1 } } # support for <p> in html mode
    end
    configure :method_of_preparation, :wysihtml5  do
      config_options  toolbar: { fa: true }, # use font-awesome instead of glyphicon
        html: true, # enables html editor
        parserRules: { tags: { p:1 } } # support for <p> in html mode
    end
    configure :recipe_dish_types do
      visible(false)
    end
    configure :recipe_kitchen_helpers do
      visible(false)
    end
    configure :recipe_main_ingredients do
      visible(false)
    end
    configure :recipe_meal_times do
      visible(false)
    end
    configure :recipe_occasions do
      visible(false)
    end
    configure :recipe_spices do
      visible(false)
    end
    configure :recipe_reviews do
      visible(false)
    end
    configure :slug do
      hide
    end
    configure :reviews_average do
      hide
    end
    configure :reviews_count do
      hide
    end
  end
  config.model Event do
    weight 2
    configure :description, :wysihtml5  do
      config_options  toolbar: { fa: true }, # use font-awesome instead of glyphicon
        html: true, # enables html editor
        parserRules: { tags: { p:1 } } # support for <p> in html mode
    end
    configure :slug do
      hide
    end
  end
  config.model Interview do
    weight 3
    label "Interview / Blog Post"
    label_plural "Interviews / Blog Post"
    configure :description, :wysihtml5  do
      config_options  toolbar: { fa: true }, # use font-awesome instead of glyphicon
        html: true, # enables html editor
        parserRules: { tags: { p:1 } } # support for <p> in html mode
    end
    configure :slug do
      hide
    end
  end
  config.model InterviewQuestion do
    parent Interview
    label "Interview Question / Blog subsection"
    label_plural "Interview Questions / Blog subsections"
    configure :description, :wysihtml5  do
      config_options  toolbar: { fa: true }, # use font-awesome instead of glyphicon
        html: true, # enables html editor
        parserRules: { tags: { p:1 } } # support for <p> in html mode
    end
  end
  config.model Competition do
    parent Event
    weight 1
    configure :slug do
      hide
    end
  end
  config.model PressRelease do
    parent Event
    weight 2
    configure :slug do
      hide
    end
  end
  config.model Place do
    weight 4
    configure :description, :wysihtml5  do
      config_options  toolbar: { fa: true }, # use font-awesome instead of glyphicon
        html: true, # enables html editor
        parserRules: { tags: { p:1 } } # support for <p> in html mode
    end
    configure :slug do
      hide
    end
  end
  config.model PlaceCategory do
    parent Place
    configure :description, :wysihtml5  do
      config_options  toolbar: { fa: true }, # use font-awesome instead of glyphicon
        html: true, # enables html editor
        parserRules: { tags: { p:1 } } # support for <p> in html mode
    end
    configure :places do
      visible(false)
    end
  end
  config.model Advertisment do
    weight 5
    configure :description, :wysihtml5  do
      config_options  toolbar: { fa: true }, # use font-awesome instead of glyphicon
        html: true, # enables html editor
        parserRules: { tags: { p:1 } } # support for <p> in html mode
    end
  end
  config.model HomepageImage do
    visible(false)
  end
  config.model InteractiveImage do
    weight 0
    configure :description, :wysihtml5  do
      config_options  toolbar: { fa: true }, # use font-awesome instead of glyphicon
        html: true, # enables html editor
        parserRules: { tags: { p:1 } } # support for <p> in html mode
    end
  end
  config.model SeoData do
    weight 5
  end

end
