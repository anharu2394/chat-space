Rails.application.routes.draw do
  resources :users,only: [:edit,:update]
  resources :groups do
    resources :messages
  end

  devise_for :users
  root 'groups#index'

end
