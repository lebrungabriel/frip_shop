Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show, :new, :create] do
    resources :order_items, only: [:create]
    resources :liked_items, only: [:create]
  end
  resources :order_items, only: [:index, :destroy]
  resources :liked_items, only: [:index, :destroy]
end
