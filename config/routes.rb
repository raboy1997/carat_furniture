Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :orders
  resources :products
  resources :categories

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'products#products_index'

  get '/search' , to: 'products#search' , as: 'products_search'
  get '/show_products_category', to: 'products#show_products_category', as: 'show_products_category'
  get '/products_index', to: 'products#products_index', as: 'products_index'

end
