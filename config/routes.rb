Rails.application.routes.draw do
  devise_for :users

  resources :customers, only: [:index]
  resources :food_items
  
  root 'welcome#index'
end