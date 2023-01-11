Rails.application.routes.draw do
  #get 'devise/session#new'
  root to: 'home#index'
  devise_for :users
  resources :produtos
  resources :vendas
  resources :clientes
end
