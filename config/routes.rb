Rails.application.routes.draw do
  devise_for :users
  get '/' => 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'users/:id' => 'users#show'
  patch '/users/:id/withdrawal' => 'users#withdrawal', as: 'withdrawal'
end
