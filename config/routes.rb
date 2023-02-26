Rails.application.routes.draw do
  devise_for :users
  root to: 'articles#index'

  resources :articles, except: [:destroy]
  resources :order_items, only: [:create]
end
