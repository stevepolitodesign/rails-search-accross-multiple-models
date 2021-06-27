Rails.application.routes.draw do
  root to: 'search_entries#index'
  get 'search_entries/index', as: 'search'
  resources :users
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
