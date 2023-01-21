Rails.application.routes.draw do
  resources :items
  get 'carrinho/show'
  resources :vendas
  resources :produtos
  resources :clientes
  resources :itemvendas
  resources :carrinho, only:[:show]
  #get 'devise/session#new'
  #devise_for :users
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  

  root to: 'home#index'
end
