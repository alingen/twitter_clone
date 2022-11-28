Rails.application.routes.draw do
  devise_for :users
  get '/' => 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  resources :users, only: %i[show]
end
