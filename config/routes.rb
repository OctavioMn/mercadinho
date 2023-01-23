Rails.application.routes.draw do

  get 'vendas/generate', to: 'vendas#generate', as: 'pdf_generate'

  resources :items
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
