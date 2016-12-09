Rails.application.routes.draw do
  resources :service_requests do
    put 'begin', to: 'service_requests#begin'
    put 'complete', to: 'service_requests#complete'
    put 'cancel', to: 'service_requests#cancel'
  end
  resources :messages
  namespace :admin do
    resources :users
    resources :messages
    resources :service_requests
    root to: "users#index"
  end
  root to: 'visitors#index'
  devise_for :users
end
