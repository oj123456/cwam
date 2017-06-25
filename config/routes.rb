Rails.application.routes.draw do

  get 'interviews/details/:slug', to: 'interviews#show', as: 'interview_detail'

  get 'users/recipe_box'
  post 'users/add_to_recipe_box'
  post 'users/review_recipe'
  delete 'users/delete_from_recipe_box'

  namespace :admin do
    get 'import', to: 'import#index'
    post 'import/import'
  end

  get 'home/index'

  get 'recipe', to: 'recipe#index'
  get 'recipe/autofill_search', to: 'recipe#autofill_search'
  get 'recipe/listing', to: 'recipe#listing'
  get 'recipe/details/:slug', to: 'recipe#show', as: 'recipe_detail'

  get 'helpers', to: 'helpers#index'
  get 'foodie_station', to: 'news#index', as: 'news'

  get 'about', to: 'about#index'
  post 'contact', to: 'about#submit_contact'
  post 'newsletter', to: 'about#subscribe_newsletter'
  get 'restaurants', to: 'restaurants#index'

  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #we add the index as default root
  root 'home#index'
end
