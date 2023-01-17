Rails.application.routes.draw do
  resources :vendas
  resources :produtos
  resources :clientes
  #get 'devise/session#new'
  #devise_for :users
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  

  root to: 'home#index'
end
