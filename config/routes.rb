Rails.application.routes.draw do
  devise_for :users
  root 'reviews#index'
  resources :reviews do
    post 'add' => 'like_reviews#create'
    delete '/add' => 'like_reviews#destroy'
    get '/post/hashtag/:name', to: "reviews#hashtag"
    resources :comments, only: [:create, :destroy] do
      post 'add' => 'like_comments#create'
      delete '/add' => 'like_comments#destroy'
    end
    collection do
      get 'search'
    end
  end
  resources :users, only: :show 
end
