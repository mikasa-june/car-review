Rails.application.routes.draw do
  devise_for :users
  root 'reviews#index'
  resources :reviews do
    resources :comments, only: :create
  end
end
