Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :people, only: [:index, :new, :create]
  resources :companies
  root to: 'people#index'
end
