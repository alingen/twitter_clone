Rails.application.routes.draw do
  get 'comments/:id' => 'comments#show', as:'comment_show'
  get 'comments/:id/new' => 'comments#new'
  post 'comments/:id/create' => 'comments#create', as: 'comment_create'

  post 'users/:id/update' => 'users#update', as: 'user_update'

  get '/' => 'home#top'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

  resources :users, only: %i[show]
  resources :tweets
end
