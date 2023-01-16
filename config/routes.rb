Rails.application.routes.draw do
  #get 'devise/session#new'
  #devise_for :users
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  resources :produtos
  resources :vendas
  resources :clientes

  root to: 'home#index'
end
