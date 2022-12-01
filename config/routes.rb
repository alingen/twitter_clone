Rails.application.routes.draw do
  get 'comments/:id/new' => 'comments#new'
  post 'comments/:id/create' => 'comments#create'

  devise_for :users
  root to: 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'

  resources :users, only: %i[show]
  resources :tweets
  resources :comments
end
