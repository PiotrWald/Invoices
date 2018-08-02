# frozen_string_literal :true

Rails.application.routes.draw do
  root to: 'products#index'
  resources :products
  resources :invoices
  resources :invoices_products, only: [:create, :update]
  resource :checkout, only: [:create, :new]
end