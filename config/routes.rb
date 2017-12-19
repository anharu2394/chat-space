Rails.application.routes.draw do
  resources :users,only: [:edit,:update]
  resources :groups
  devise_for :users
  root 'groups#index'

end
