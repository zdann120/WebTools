Rails.application.routes.draw do
  resources :messages
  namespace :admin do
    resources :users
    resources :messages
    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_for :users
end
