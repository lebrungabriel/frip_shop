Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products, only: [:index, :show, :new, :create, :destroy] do
    resources :orders, only: [:show, :create]
  end
  resources :orders, only: [:index]
end
