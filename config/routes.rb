Rails.application.routes.draw do
  get 'comments/:id/show' => 'comments#show'
  get 'comments/:id/new' => 'comments#new'
  post 'comments/:id/create' => 'comments#create'

  post 'users/:id/update' => 'users#update'

  devise_for :users
  get '/' => 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  get 'tweets/new' => 'tweets#new'
  post 'tweets/create' => 'tweets#create'

  resources :users, only: %i[show]
end
