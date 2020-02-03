Rails.application.routes.draw do
  devise_for :users
  root 'reviews#index'
  resources :reviews do
    
    post 'add' => 'like_reviews#create'
    delete '/add' => 'like_reviews#destroy'
    
    resources :comments, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show 
end
