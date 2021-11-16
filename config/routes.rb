Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace,
        defaults: { format: :jsonapi } do
    scope module: "api/v1", as: "api" do
      resources :bookmark_statuses

      resources :review_details

      resources :actor_details

      resources :director_details

      resources :movies

      resources :user_details
    end
    mount VandalUi::Engine, at: "/vandal"
    # your routes go here
  end
  ActiveAdmin.routes(self)
  root to: "user_details#index"
  resources :bookmark_statuses
  resources :review_details
  resources :actor_details
  resources :director_details
  resources :movies
  resources :user_details
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
