Rails.application.routes.draw do
  get 'comments/:id/new' => 'comments#new'
  post 'comments/:id/create' => 'comments#create', as: 'comment_create'

  get '/' => 'home#top', as: 'root'
  post 'users/:id/update' => 'users#update', as: 'user_update'
  get 'users/:id/reply' => 'users#reply', as: 'user_reply'
  get 'users/:id/likes' => 'users#likes', as: 'user_likes'

  post "likes/:tweet_id/create" => "likes#create"
  post "likes/:tweet_id/destroy" => "likes#destroy"

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

  resources :users, only: %i[show]
  resources :tweets, :comments
end
