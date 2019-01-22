Rails.application.routes.draw do
  devise_for :users

  resources :customers, only: [:index]
  resources :food_items
  resources :menu, only: [:index]
  resources :restaurants, only: [:show]

  root 'welcome#index'
end