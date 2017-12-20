Rails.application.routes.draw do
  resources :users,only: [:edit, :update]
  resources :groups,only: [:index, :new, :create, :edit, :update] do
    resources :messages,only: [:index, :new, :create]
  end

  devise_for :users
  root 'groups#index'

end
