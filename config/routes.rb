Rails.application.routes.draw do
  get 'users/edit', to: 'users#edit'
  devise_for :users
  root 'messages#index'

end
