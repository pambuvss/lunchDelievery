Rails.application.routes.draw do
  devise_for :users

  resources :customers, only: [:index]
  resources :food_items, only: [:show, :new, :create]
  resources :menus, only: [:show]
  resources :restaurants, only: [:show]

  root 'welcome#index'
end