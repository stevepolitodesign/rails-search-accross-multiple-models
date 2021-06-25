Rails.application.routes.draw do
  resources :search_entries
  resources :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
