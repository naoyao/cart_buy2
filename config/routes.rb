Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'

  resources :products
  resources :homes, only: [:index]
  resources :cart_items, only: [:show]
  resources :user

  post '/new' => 'cart_items#new'
  post '/update' => 'cart_items#update'
  delete '/delete' => 'cart_items#delete'
end
