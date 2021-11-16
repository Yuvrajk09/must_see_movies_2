Rails.application.routes.draw do
  resources :review_details
  resources :actor_details
  resources :director_details
  resources :movies
  resources :user_details
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
