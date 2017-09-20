# frozen_string_literal :true

Rails.application.routes.draw do
  root to: 'products#index'
  resources :products
  resources :invoices, only: %i[index show]
  resources :invoices_products, only: %i[create update]
  resources :checkouts, only: %i[new create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
